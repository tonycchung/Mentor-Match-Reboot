require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  before do
    @mentor = users(:mentor_user)
    @mentee = users(:mentee_user)
    @friendship = Friendship.create(user: @mentee, friend: @mentor, state: 'accepted')
  end

  describe '#accept' do
    it 'changes the friendship state to approved' do
      mentor_request = Friendship.create(user_id: 100, friend_id: 200, state: 'pending')
      mentor_request.accept
      mentor_request.state.must_equal 'Accepted'
    end
  end

  describe '#find_mentor' do
    it 'determines which user is a mentor' do
      @friendship.find_mentor.must_equal @mentor
    end

    it 'returns a user object' do
      @friendship.find_mentor.must_be_instance_of User
    end
  end

  describe '#find_mentee' do
    it 'determines which user is a mentor' do
      @friendship.find_mentee.must_equal @mentee
    end
  end
end
