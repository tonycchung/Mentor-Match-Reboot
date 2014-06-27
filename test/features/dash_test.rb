require "test_helper"

feature "As a user I can do things from my dashboard" do

  scenario "I can get to my dashboard and then view available mentees" do
    sign_in_mentor
    visit users_path
    first(:link, "Dashboard").click
    page.must_have_content "Browse Mentees"
    first(:link, "Browse Mentees").click
    page.must_have_content "Listing Mentees"
  end

  scenario "I can get to my dashboard and then view available mentors and then " do
    sign_in_mentee
    visit users_path
    first(:link, "Dashboard").click
    page.must_have_content "Browse Mentors"
    first(:link, "Browse Mentors").click
    # save_and_open_page
    page.must_have_content "Listing Mentors"
  end
end
