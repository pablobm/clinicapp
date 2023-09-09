require 'rails_helper'

RSpec.feature 'Doctor logs in and leaves a prescription for a User' do
    scenario 'with valid credentials' do
        user = FactoryBot.create(:user)
        doctor = FactoryBot.create(:doctor)
        appointment = FactoryBot.create(:appointment, user: user, doctor: doctor)
        expect(appointment).to be_valid
        expect(appointment.user).to eq(user)
        expect(appointment.doctor).to eq(doctor)
      
        visit new_doctor_session_path
    
        fill_in 'Phone', with: doctor.phone
        fill_in 'Password', with: 'qwerty' 
        click_button 'Log in'

        expect(page).to have_content 'Signed in successfully'
        expect(page).to have_content 'Doctors public page'

        visit new_prescription_path(appointment_id: appointment.id)
        fill_in 'Prescript', with: 'Aspirin'
        click_button 'Submit'

        expect(page).to have_content('Your prescription was successfully created')
    
    end
end