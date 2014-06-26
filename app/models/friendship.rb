class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"
  validate :legit_friendship?

private

  def already_friend?
    current_user.friendships.where(:friend_id => user.id).where(:user_id => current_user.id).empty?
  end

  def legit_friendship?
    friend_id != user_id
  end

end
