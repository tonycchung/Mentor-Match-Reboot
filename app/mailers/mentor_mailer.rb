class MentorMailer < ActionMailer::Base
  default from: "admin@mentormatcher.com"

  def mentor_request(user)
    mail(to: user.email, subject: "Mentorship request!")
  end
end
