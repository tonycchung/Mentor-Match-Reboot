ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"
require "pry"


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

def sign_in_mentor(role = :mentor_user)
  visit new_user_session_path
  fill_in "Email", with: users(role).email
  fill_in "Password", with: 'password'
  click_button "Sign in"
end

def sign_in_mentee(role = :mentee_user)
  visit new_user_session_path
  fill_in "Email", with: users(role).email
  fill_in "Password", with: 'password'
  click_button "Sign in"
end
