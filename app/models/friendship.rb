class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validate :legit_friendship?
  validates :user_id, uniqueness: { scope: :friend_id }

  def legit_friendship?
    friend_id != user_id
  end

  def accept
    update(state: 'Accepted')
  end

  def find_mentor
    user = User.find(user_id)
    friend = User.find(friend_id)
    user.role == 'mentor' ? user : friend
  end

  def find_mentee
    user = User.find(user_id)
    friend = User.find(friend_id)
    user.role == 'mentee' ? user : friend
  end
end
