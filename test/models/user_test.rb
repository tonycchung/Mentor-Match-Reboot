require 'test_helper'

describe 'User' do
  describe '#can_request?(user)' do
    before do
      @jim = User.create(first_name: 'Jim', last_name: 'Jones', email: 'jim@test.com', password: 'password')
      @sally = User.create(first_name: 'Sally', last_name: 'Barns', email: 'sally@test.com', password: 'password')
    end

    it 'returns true if users do not have a friendship' do
      @jim.can_request?(@sally).must_equal true
    end

    it 'returns false if the inputed user is themselves' do
      @jim.can_request?(@jim).must_equal false
    end

    it 'returns false if the users have a friendship' do
      john = User.create(first_name: 'John', last_name: 'Jones', email: 'john@test.com', password: 'password')
      sally = User.create(first_name: 'Sally', last_name: 'Barns', email: 'sally2@test.com', password: 'password')
      friendship = Friendship.create!(user_id: john.id, friend_id: sally.id, state: 'pending')
      sally.can_request?(john).must_equal false
      john.can_request?(sally).must_equal false
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
end
