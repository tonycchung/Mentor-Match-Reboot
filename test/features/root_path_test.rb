require "test_helper"

feature "root path takes you to the sign in path" do
  before do
    visit root_path
  end

  scenario "when you visit root path two options" do
    page.must_have_content "Find a Mentor"
    page.must_have_content "Become a Mentor"
  end

  scenario "visit find a mentor" do
    click_on "Find a Mentor"
    page.must_have_content "Sign up"
  end

  scenario "visit become a mentor" do
    click_on "Become a Mentor"
    page.must_have_content "Sign up"
  end

  scenario "sign out link wont be visible if signed in" do

  end

end
