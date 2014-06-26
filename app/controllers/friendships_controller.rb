class FriendshipsController < ApplicationController

  def show
  end

  def create
    @friendship = Friendship.new(friend_id: params[:friend_id], user_id: current_user.id, state: "pending")
    if @friendship.save
      flash[:notice] = "Added Mentor"
      redirect_to users_path
    else
      flash[:notice] = "Unable to add Mentor"
      redirect_to users_path
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Succesfully deleted relationship"
    redirect_to current_user
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.state = params[:state]
    @friendship.save!
    flash[:notice] = "Mentorship approved"
    redirect_to users_path
  end

end
