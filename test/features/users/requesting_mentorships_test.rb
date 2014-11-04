require 'test_helper'

feature 'Mentorships' do
  scenario 'a mentee makes a request to be mentored' do
    sign_in_mentee

    visit user_path(users(:mentor_user))
    click_button 'Request Mentor'
    page.must_have_content 'Hi, #{users(:mentee)}'
  end
end
