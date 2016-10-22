class FriendshipsController < ApplicationController
  def create
    friendship = current_user.friendships.build friend_id: params[:friend_id]
    if friendship.save
      flash[:success] = "Added #{friendship.friend}."
    else
      flash[:error] = "Unable to add #{friendship.friend} as friend."
    end
    redirect_to root_url
  end

  def destroy
    friendship = current_user.friendships.find params[:id]
    friendship.destroy
    flash[:success] = "Removed friendship with #{friendship.friend}."
    redirect_to root_url
  end
end
