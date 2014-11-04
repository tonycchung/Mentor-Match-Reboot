require "test_helper"

feature "As a mentor" do

  scenario "I can get to my dashboard and view only mentees" do
    sign_in_mentor

    page.must_have_content users(:mentee_user).first_name
    page.must_have_content users(:mentee_user).last_name
    page.must_have_content users(:mentee_user_2).first_name
    page.must_have_content users(:mentee_user_2).last_name

    page.wont_have_content users(:mentor_user_2).first_name
  end

  scenario 'I can paginate through different mentees' do
    sign_in_mentor

    page.must_have_content users(:mentee_user).first_name
    page.wont_have_content users(:mentee_user_8).first_name
    first(:link, "Next").click

    page.must_have_content users(:mentee_user_8).first_name
    page.wont_have_content users(:mentee_user).first_name
    first(:link, "Previous").click

    page.must_have_content users(:mentee_user).first_name
    page.wont_have_content users(:mentee_user_8).first_name
  end
end

feature 'As a mentee' do
  scenario 'I can get to my dashboard and view only mentors' do
    sign_in_mentee

    page.must_have_content users(:mentor_user).first_name
    page.must_have_content users(:mentor_user_2).first_name

    page.wont_have_content users(:mentee_user_2).first_name
  end
end
