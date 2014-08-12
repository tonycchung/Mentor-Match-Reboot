@admin = User.create(email: "admin@admin.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  admin: true)

@mentor = User.create(email: "mentor@mentor.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  first_name: "Brook",
  last_name: "Riggio",
  background: "Rails Developer",
  accomplishments: "Code Fellows",
  company: "Code Fellows",
  position: "Teacher",
  role: "mentor")

@mentee = User.create(email: "mentee@mentee.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  first_name: "Tony",
  last_name: "Chung",
  background: "Rails Developer",
  accomplishments: "mentor match app",
  role: "mentee")

@mentorship = Friendship.create(user_id: @mentor.id, friend_id: @mentee.id)

%w[mentor mentee].each do |ment|
  10.times do |n|
    User.create(
      email: "#{ment}#{n}@example.com",
      password: "asdfasdf",
      password_confirmation: "asdfasdf",
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      background: "#{Faker::Hacker.ingverb.capitalize} #{Faker::Hacker.adjective} #{Faker::Hacker.noun} #{Faker::Hacker.abbreviation}.",
      accomplishments: Faker::Company.bs.capitalize,
      company: Faker::Company.name,
      position: "#{Faker::Hacker.adjective.titleize} #{%w[Teacher Healer Instructor Engineer Developer].sample}",
      role: "#{ment}"
    )
  end
end

