require "test_helper"

feature "All types users will have to ability to sign out" do

  scenario "as an mentee I can sign out and will be redirected to the home page" do
    sign_in_mentee
    first(:link, "Dashboard").click
    first(:link, "Sign out").click
    page.text.must_include "Dexter"
    page.text.must_include "Signed out successfully."
  end

  scenario "as an mentor I can sign out and will be redirected to the home page" do
    sign_in_mentor
    first(:link, "Dashboard").click
    first(:link, "Sign out").click
    page.text.must_include "Dexter"
    page.text.must_include "Signed out successfully."
  end

  scenario "as an admin I can sign out and will be redirected to the home page" do
    sign_in_admin
    first(:link, "Dashboard").click
    first(:link, "Sign out").click
    page.text.must_include "Dexter"
    page.text.must_include "Signed out successfully."
  end
end
