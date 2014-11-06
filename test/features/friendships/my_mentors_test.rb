require 'test_helper'

feature 'As a mentee, I should be able to view my connected mentors' do
  before do
    sign_in_mentee
    visit user_path users(:mentor_user)
    click_on 'Request Mentor'
    click_on 'Sign Out'

    sign_in_mentor
    first(:link, 'Accept').click
    visit user_path users(:mentee_user_3)
    click_on 'Request Mentee'
    click_on 'Sign Out'

    sign_in_mentee
  end

  scenario 'I should see My Mentors link on the dashboard' do
    visit root_path
    page.must_have_link 'My Mentors'
  end

  scenario 'I should see My Mentors link from the Browse path' do
    visit users_path
    page.must_have_link 'My Mentors'
  end

  scenario 'I should see My Mentors link from the friendships path' do
    visit friendships_path
    page.must_have_link 'My Mentors'
  end

  scenario 'I should see my mentors after clicking My Mentors link' do
    click_on 'My Mentors'

    page.must_have_content users(:mentor_user).first_name
    page.must_have_content users(:mentor_user).last_name
  end
end
