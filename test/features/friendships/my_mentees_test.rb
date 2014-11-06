require 'test_helper'

feature 'As a mentor, I want to see mentees who are connected to me' do
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

    sign_in_mentee :mentee_user_3
    first(:link, 'Accept').click
    click_on 'Sign Out'

    sign_in_mentee :mentee_user_2
    click_on 'Sign Out'
    sign_in_mentee :mentee_user_2
    visit user_path users(:mentor_user)
    click_on 'Request Mentor'
    click_on 'Sign Out'

    sign_in_mentor
  end

  scenario 'I should see My Mentees link on the dashboard' do
    visit root_path
    page.must_have_link 'My Mentees'
  end

  scenario 'I should see My Mentees link from the Browse path' do
    visit users_path
    page.must_have_link 'My Mentees'
  end

  scenario 'I should see My Mentees link from the friendships path' do
    visit friendships_path
    page.must_have_link 'My Mentees'
  end

  scenario 'If I click on My Mentees, I should see my mentees' do
    click_on 'My Mentees'

    page.must_have_content users(:mentee_user).fullname
    page.wont_have_content users(:mentee_user_2).fullname
    page.must_have_content users(:mentee_user_3).fullname
    page.wont_have_content users(:mentee_user_4).fullname
  end
end

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

  scenario 'I should see my mentors after clicking My Mentors link' do

    click_on 'My Mentors'
    save_and_open_page
    page.must_have_content users(:mentor_user).first_name
    page.must_have_content users(:mentor_user).last_name
  end
end
