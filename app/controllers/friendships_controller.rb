class FriendshipsController < ApplicationController

  def show
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
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
end
