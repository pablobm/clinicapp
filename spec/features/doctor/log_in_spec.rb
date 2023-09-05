require 'rails_helper'

RSpec.feature 'Doctor logs in' do
  scenario 'with valid credentials' do
    
    doctor = FactoryBot.create(:doctor)

    visit new_doctor_session_path

   
    fill_in 'Phone', with: doctor.phone
    fill_in 'Password', with: 'password' 
    click_button 'Log in'

    expect(page).to have_content 'Logged in successfully'
    expect(page).to have_content 'Doctors public page'
  end
end