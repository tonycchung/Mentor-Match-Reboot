require "test_helper"

feature "Creating a new account" do
  scenario "when a user creates a new account they are taken
            to a page to fill out their profile information" do
    visit new_user_registration_path
    fill_in "Email", with: "Test@testmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
    page.text.must_include "Background"
    page.text.must_include "Accomplishments"
  end

end
