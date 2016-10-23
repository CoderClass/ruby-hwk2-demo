class HomeController < ApplicationController
  def index
    if current_user
      redirect_to incoming_messages_path
    end

    @content = File.read(Rails.root.join("README.md"))
  end
end
