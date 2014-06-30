# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first

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

@mentor = User.create(email: "mentor1@mentor.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  first_name: "Ivan",
  last_name: "Oats",
  background: "Rails Developer",
  accomplishments: "Code Fellows",
  company: "Code Fellows",
  position: "Teacher",
  role: "mentor")

@mentee = User.create(email: "mentee1@mentee.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  first_name: "Brian",
  last_name: "Studwell",
  background: "UX Developer",
  accomplishments: "mentor match app",
  role: "mentee")

@admin = User.create(email: "admin@admin.com",
  password: "asdfasdf",
  password_confirmation: "asdfasdf",
  admin: true)

@mentorship = Friendship.create(user_id: 2,
friend_id: 1)
