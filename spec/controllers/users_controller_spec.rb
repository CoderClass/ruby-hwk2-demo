require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  def sign_in(user)
    session[:user_id] = user.id
  end

  describe "GET /users" do
    it "redirects if user is not logged in" do
      get :index
      expect(response).to redirect_to(sign_in_path)
    end

    it "displays users if user is signed in" do
      user = User.create! email: "a@example.com", password: "asdf"
      sign_in user
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
