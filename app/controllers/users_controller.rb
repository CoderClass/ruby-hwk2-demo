class UsersController < ApplicationController
  def index
    @users = current_user.all_other_users.order("name")
  end

  def new
    @user = User.new
    render layout: 'application'
  end

  def show
    @user = current_user
  end

  def create
   @user = User.new user_params
   if @user.save
     flash[:success] = "User created successfully"
     # OPTIONAL: sign the user in without logging in
     # OPTIONAL: email the user
     redirect_to root_path
   else
     render 'new', layout: 'application'
   end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
