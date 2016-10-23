module UsersHelper
  def display_user_or_me(user)
    user == current_user ? 'You' : user
  end
end
