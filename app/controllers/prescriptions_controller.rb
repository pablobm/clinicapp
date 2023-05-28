class PrescriptionsController < ApplicationController
  before_action :authenticate_doctor!, only: %i[create destroy]

  def index
    @user = current_doctor
    @appointments = @user.appointments
    appointment_ids = @appointments.map(&:id)
    @prescription = Prescription.where(appointment_ids: appointment_ids)
  end

  def show
    @user = current_doctor
    @prescription = Prescription.find(params[:id])
    @appointment = Appointment.find(@prescription.appointment_id)
  end

  def new
    @user = current_doctor
    @appointment = Appointment.find_by(id: params[:appointment_id])
    @prescription = Prescription.new
  end

  def create
    @user = current_doctor
    @appointment = Appointment.find_by(id: params[:appointment_id])
    @prescription = Prescription.new(prescription_params)

    if @prescription.save
      redirect_to prescriptions_path
      flash[:notice] = 'Your prescription was successfully created'
    else
      render :new, alert: 'An error has occurred while creating a prescription'
    end
  end

  def destroy
    @prescription = Prescription.find(params[:id])
    @prescription.destroy!
    redirect_to prescriptions_path(current_doctor.id), notice: 'Recommendation was deleted'
  end

  private

  def prescription_params
    params.require(:prescription).permit(:prescript, :appointment_id)
  end
end
