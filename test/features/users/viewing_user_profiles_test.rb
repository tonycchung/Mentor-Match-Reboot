require 'test_helper'

feature 'As a mentor I can view my own profile and other user profiles' do
  scenario 'A mentor views own profile and sees all of their attributes' do
    sign_in_mentor
    click_link "My Account"
    page.must_have_content
      "Name: #{users(:mentor_user).first_name.capitalize}
      #{users(:mentor_user).last_name.capitalize}"
    page.must_have_content 'Edit'
    page.must_have_content 'Home'
  end

  scenario 'A mentor views another user' do
    sign_in_mentor
    visit user_path(users(:mentee_user))

    page.wont_have_content 'Edit'
    page.must_have_content 'Home'

    page.must_have_content 'Home'
    page.must_have_content 'Bio'
    page.must_have_content 'Technologies'
    page.must_have_content 'Course'

    page.wont_have_content 'Company'
    page.wont_have_content 'Position'
  end
end

feature 'As a mentee, I can view my own profile and other profile' do
  before do
    sign_in_mentee
  end

  scenario 'As a mentee viewing own profile' do
    click_link 'My Account'

    page.must_have_content 'Edit'
    page.must_have_content 'Home'
    page.must_have_content
      "Name: #{users(:mentee_user).first_name.capitalize}
      #{users(:mentee_user).last_name.capitalize}"
    page.must_have_content 'Bio'
    page.must_have_content 'Technologies'
    page.must_have_content 'Course'
  end

  scenario 'As a mentee viewing a profiles of a mentor' do
    visit users_path

    first(:link, 'View Details').click

    page.must_have_content 'Name'
    page.must_have_content 'Bio'
    page.must_have_content 'Company'
    page.must_have_content 'Position'

    page.wont_have_content 'Accomplishments'
    page.wont_have_content 'Technologies'
    page.wont_have_content 'Professional summary'
    page.wont_have_content 'Personal statement'
    page.wont_have_content 'Graduating Class'
    page.wont_have_content 'Course'
  end
end
