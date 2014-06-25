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
    @friendship = Friendship.find(params[:id])
    @fiendship.destroy
    flash[:notice] = "Succesfully destroyed career"
    redirect_to root_url
  end
end
