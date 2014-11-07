require 'test_helper'

feature 'root path takes you to the sign in path' do

  before do
    visit root_path
  end

  scenario 'when you visit root path two options' do
    page.must_have_content 'Find a Mentor'
    page.must_have_content 'Become a Mentor'
  end

  scenario 'visit find a mentor' do
    click_link 'Find a Mentor'
    page.must_have_content 'Create Account'
  end

  scenario 'visit become a mentor' do
    click_link 'Become a Mentor'
    page.must_have_content 'Create Account'
  end

  scenario 'sign out link wont be visible unless signed in' do
    page.wont_have_link 'Sign out'
  end
end
