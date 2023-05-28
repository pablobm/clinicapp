class DoctorsController < ApplicationController
before_action :set_doctor_item, only: %i[update]
  before_action :authenticate_doctor!

  def index
    @doctor = current_doctor
  end

  def show
    @appointments = Appointment.where(doctor_id: current_doctor.id)
    @prescriptions = Prescription.where(appointments_id: current_doctor.id)
  end

  def new
    @doctor = Doctor.new
  end

  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to doctor_path, notice: 'The photo added to your profile' }
      else
        format.html { render :index }
      end
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:main_image)
  end

  def set_doctor_item
    @doctor = Doctor.find(params[:id])
  end
end
