require 'test_helper'

class UserTest < ActiveSupport::TestCase
  describe '#can_request?(user)' do
    before do
      @jim = users(:mentee_user)
      @sally = users(:mentor_user)
    end

    it 'returns true if users do not have a friendship' do
      @jim.can_request?(@sally).must_equal true
    end

    it 'returns false if the inputed user is themselves' do
      @jim.can_request?(@jim).must_equal false
    end

    it 'returns false if the users have a friendship' do
      friendship = Friendship.create(user: @jim, friend: @sally, state: 'pending')
      # binding.pry
      @sally.can_request?(@jim).must_equal false
      @jim.can_request?(@sally).must_equal false
    end
  end

  describe '#change_availability' do
    it 'sets the users available attribute to true' do
      jim = User.create(first_name: 'Jim', last_name: 'Jones', email: 'jim@test.com', password: 'password', available: false)
      jim.change_availability.must_equal true
    end

    it 'sets the users available attribute to false' do
      jim = User.create(first_name: 'Jim', last_name: 'Jones', email: 'jim@test.com', password: 'password', available: true)
      jim.change_availability.must_equal false
    end
  end

  describe '#display_availability' do
    it 'returns unavailable if the available attribute of the user is false' do
      jim = User.create(first_name: 'Jim', last_name: 'Jones', email: 'jim@test.com', password: 'password', available: false)
      jim.display_availability.must_equal 'unavailable'
    end

    it 'returns available if the available attribute is true' do
      jim = User.create(first_name: 'Jim', last_name: 'Jones', email: 'jim@test.com', password: 'password', available: true)
      jim.display_availability.must_equal 'available'
    end
  end

  describe '#find_friendship(user)' do
    it 'returns the friendship between the two users' do
      mentee = users(:mentee_user)
      mentor = users(:mentor_user)
      friendship = Friendship.create(user: mentee, friend: mentor, state: 'Accepted')
      mentee.find_friendship(mentor).must_equal friendship
      mentor.find_friendship(mentee).must_equal friendship
    end

    it 'returns nil if the friendship does not exist' do
      mentee = users(:mentee_user)
      mentor = users(:mentor_user)
      mentee.find_friendship(mentor).must_equal nil
    end
  end
end
