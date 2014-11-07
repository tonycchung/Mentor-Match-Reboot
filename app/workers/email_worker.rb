class EmailWorker
  include Sidekiq::Worker

  def perform(mentor, mentee, count)
    MentorshipMailer.acceptance_email_to_mentee(mentor, mentee)
    MentorshipMailer.acceptance_email_to_mentor(mentor, mentee)
  end
end
