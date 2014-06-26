class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"

  def already_friend?
    current_user.friendships.where(:friend_id => user.id).where(:user_id => current_user.id).empty?
  end
end
