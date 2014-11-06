require 'test_helper'

feature 'mentor availability' do
  scenario 'a mentor makes themselves unavailable' do
    sign_in_mentor
    visit user_path(users(:mentor_user))
    click_on 'Change'
    page.must_have_content 'Availability: unavailable'
  end

  scenario 'other users cannot make a mentor available' do
    sign_in_mentee
    visit user_path(users(:mentor_user))
    page.wont_have_content 'Change'
  end
end
