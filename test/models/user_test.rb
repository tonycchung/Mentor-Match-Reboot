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
      friendship = Friendship.create(user: @sally, friend: @jim, state: 'pending')
      @sally.can_request?(@jim).must_equal false
      @jim.can_request?(@sally).must_equal false
    end
  end
end
