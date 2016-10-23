require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET /users" do
    it "redirects if user is not logged in" do
      get :index
      expect(response).to redirect_to(sign_in_path)
    end

    it "displays users if user is signed in" do
      # user = User.create! email: "a@example.com", password: "asdf"
      # get :index
      # expect(response).to render_template("index")
      # expect(response).to have_http_status(200)
    end
  end
end
