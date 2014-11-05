require "test_helper"

feature "As a mentor" do
  scenario "I can get to my dashboard" do
    sign_in_mentor

    page.current_path.must_equal dashboard_path(users(:mentor_user))
  end
end

feature 'As a mentee' do
  scenario 'I can get to my dashboard' do
    sign_in_mentee

    page.current_path.must_equal dashboard_path(users(:mentee_user))
  end
end
