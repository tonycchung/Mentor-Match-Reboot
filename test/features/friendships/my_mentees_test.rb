require 'test_helper'

feature 'As a mentor, I want to see mentees who are connected to me' do
  before do
    sign_in_mentee
    visit user_path users(:mentor_user)
    click_on 'Request Mentor'
    click_on 'Sign Out'

    sign_in_mentee users(:mentee_user_2)
    visit user_path users(:mentor_user)
    click_on 'Request Mentor'
    click_on 'Sign Out'

    sign_in_mentor
    first(:link, 'Accept').click
    first(:link, 'Accept').click
  end

  scenario 'If I click on My Mentees, I should see my mentees' do
    click_on 'My Mentees'

    page.must_have_content users(:mentee_user).first_name
    page.must_have_content users(:mentee_user_2).first_name
    page.wont_have_content users(:mentee_user_3).first_name
  end
end
