class EmailWorker
  include Sidekiq::Worker

  def perform(mentor, mentee, count)
    params.symbolize_keys!
    MentorshipMailer.acceptance_email_to_mentee(mentor, mentee)
    MentorshipMailer.acceptance_email_to_mentor(mentor, mentee)
  end
end
