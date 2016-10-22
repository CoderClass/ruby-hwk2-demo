class FollowingsController < ApplicationController
  layout 'users'

  def index
    @followings = current_user.followings
  end
end
