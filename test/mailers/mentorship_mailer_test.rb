require 'test_helper'

class MentorshipMailerTest < ActionMailer::TestCase
  test 'acceptance email to mentee' do
    email = MentorshipMailer.acceptance_email_to_mentee(
      users(:mentor_user),
      users(:mentee_user)).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['codefellows@info.org'], email.from
    assert_equal [users(:mentee_user).email], email.to
    assert_equal 'You have a new mentor!', email.subject
  end

  test 'acceptance email to mentor' do
    email = MentorshipMailer.acceptance_email_to_mentor(
      users(:mentor_user),
      users(:mentee_user)).deliver
    assert_not ActionMailer::Base.deliveries.empty?

    assert_equal ['codefellows@info.org'], email.from
    assert_equal [users(:mentor_user).email], email.to
    assert_equal 'You have a new mentee!', email.subject
  end
end
