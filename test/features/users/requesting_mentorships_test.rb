require 'test_helper'

feature 'Mentorships' do
  scenario 'a mentee makes a request to be mentored' do
    sign_in_mentee

    visit user_path(users(:mentor_user))
    click_on "Request Mentor"
    page.must_have_content "Hi, #{users(:mentee_user).first_name}"

    visit user_path(users(:mentor_user))
    page.wont_have_content "Request Mentor"

    visit root_path
    click_on 'requests'
    page.must_have_content users(:mentor_user).first_name
  end

  # scenario 'a mentor accepts a request to mentor' do
  #   sign_in_mentee

  #   visit user_path(users(:mentor_user))
  #   find('Request Mentor').click
  #   visit_destroy_user_session

  #   sign_in_mentor
  #   click_link 'requests'
  #   click_button 'Accept'
  #   page.must_have_content
  # end
end
