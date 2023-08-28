require "rails_helper"

RSpec.describe "Doctor loggin in", type: :feature do
    # let(:doctor) { new (:doctor) }
    @javascript
    scenario "from main page", js: true do
        visit root_path
        click_button 'Are you a doctor?'
        fill_in 'Phone', with: '1234567890'
        fill_in 'Password', with: 'qwerty'
        click_button 'Log in'
        expect(page).to have_content 'Doctors public page'
    end
end
