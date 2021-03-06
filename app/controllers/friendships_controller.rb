class FriendshipsController < ApplicationController
  layout 'users'

  def create
    friendship = current_user.friendships.build friend_id: params[:friend_id]
    if friendship.save
      flash[:success] = "Added #{friendship.friend} as friend."
    else
      flash[:error] = "Unable to add #{friendship.friend} as friend."
    end
    redirect_to users_path
  end

  def destroy
    friendship = current_user.friendships.find params[:id]
    friendship.destroy
    flash[:success] = "Removed friendship with #{friendship.friend}."
    redirect_to users_path
  end

  def index
    @friendships = current_user.friendships
  end
end
