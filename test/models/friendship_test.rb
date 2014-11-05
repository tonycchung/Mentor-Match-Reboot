require 'test_helper'

describe 'Friendship' do
  describe '#accept' do
    it 'changes the friendship state to approved' do
      mentor_request = Friendship.create(user_id: 100, friend_id: 200, state: 'pending')
      mentor_request.accept
      mentor_request.state.must_equal 'Accepted'
    end
  end
end
