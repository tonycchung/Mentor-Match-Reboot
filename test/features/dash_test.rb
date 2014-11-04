require "test_helper"

feature "As a user I can do things from my dashboard" do

  scenario "I can get to my dashboard and view available mentees" do
    sign_in_mentor

    page.must_have_content users(:mentee_user).first_name
    page.must_have_content users(:mentee_user).last_name
    page.must_have_content users(:mentee_user_2).first_name
    page.must_have_content users(:mentee_user_2).last_name
  end

  # scenario "I can get to my dashboard and then view available mentors and then " do
  #   sign_in_mentee
  #   # visit users_path
  #   page.must_have_content "Browse"
  #   # first(:link, "Browse Mentors").click
  #   clik_link('Browse')
  #   page.must_have_content "Listing Mentors"
  # end
end
