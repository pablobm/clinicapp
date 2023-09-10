require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  describe "POST /appointments" do
    let(:valid_attributes) do
      user = create(:user)
      doctor = create(:doctor)
      {
        appointment_date: Date.today + 1.day,
        user_id: user.id,
        doctor_id: doctor.id,
        appointment_datetime: DateTime.now
      }
    end

    before do
      @user = create(:user) 
      sign_in @user
    end

    it "creates a new appointment" do
      expect {
        post "/appointments", params: { appointment: valid_attributes }
      }.to change(Appointment, :count).by(1)

      expect(response).to have_http_status(:redirect)
    end

    # it "redirects to the created appointment" do
    #   post "/appointments", params: { appointment: valid_attributes }
    #   expect(response).to redirect_to(Appointment.last)
    # end
  end
end
