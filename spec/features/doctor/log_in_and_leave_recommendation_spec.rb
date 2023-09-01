require "rails_helper"

RSpec.describe "Doctor loggin in", type: :feature do
  scenario "from main page", js: true do
    doctor = FactoryBot.create(:doctor, password: "password")
    visit root_path
    click_button "Are you a doctor?"
    fill_in "Phone", with: doctor.phone
    fill_in "Password", with: doctor.password
    click_button "Log in"
    expect(page).to have_content "Doctors public page"
  end
end
