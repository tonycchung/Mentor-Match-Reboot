require 'test_helper'

feature 'Mentorships' do
  scenario 'a mentee makes a request to be mentored' do
    sign_in_mentee

    visit user_path(users(:mentor_user))
    click_on "Request Mentor"
    page.must_have_content "Hi, #{users(:mentee_user).first_name}"

    visit user_path(users(:mentor_user))
    page.wont_have_content "Request Mentor"
  end

  scenario 'a mentor accepts a request from a mentee' do
    sign_in_mentee

    visit user_path(users(:mentor_user))
    click_on "Request Mentor"
    click_on 'Sign Out'

    sign_in_mentor
    page.must_have_content users(:mentee_user).first_name

    first(:link, "Accept").click
    page.wont_have_content users(:mentee_user).first_name
  end

  scenario 'a mentor declines a request from a mentee' do
    sign_in_mentee

    visit user_path(users(:mentor_user))
    click_on "Request Mentor"
    click_on 'Sign Out'

    sign_in_mentor
    first(:link, "Decline").click
    page.wont_have_content users(:mentee_user).first_name
  end
end
