require 'test_helper'

feature 'As a user I can view my own profile and other user profiles' do
  scenario 'A mentor views their own profile and sees all of their attributes' do
    sign_in_mentor
    click_link "My Account"
    page.must_have_content
      "Name: #{users(:mentor_user).first_name.capitalize}
      #{users(:mentor_user).last_name.capitalize}"
    page.must_have_content 'Edit'
    page.must_have_content 'Home'
  end

  scenario 'A user views another user' do
    sign_in_mentor
    visit user_path(users(:mentee_user))
    page.wont_have_content 'Edit'
    page.must_have_content 'Home'
  end
end
