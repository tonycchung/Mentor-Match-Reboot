class FriendshipsController < ApplicationController
  def create
    user = User.find(params[:friend_id])
    @friendship = Friendship.new(friend_id: params[:friend_id], user_id: current_user.id, state: "pending")
    if @friendship.save
      flash[:notice] = "Request sent!"
      redirect_to root_path
    else
      flash[:notice] = "Unable to send request."
      redirect_to user_path(user)
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Succesfully deleted relationship"
    redirect_to root_path
  end

  def update
    @friendship = Friendship.find(params[:id])
    mentor = @friendship.find_mentor
    mentee = @friendship.find_mentee
    @friendship.accepted
    @friendship.save!
    MentorshipMailer.acceptance_email_to_mentee(mentor, mentee)
    MentorshipMailer.acceptance_email_to_mentor(mentor, mentee)
    flash[:notice] = "Mentorship approved"
    redirect_to root_path
  end

end
