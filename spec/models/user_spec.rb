require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#contact_info" do
    it "renders name and email for Adam" do
      user = User.new email: "a@example.com", name: "Adam"
      expect(user.contact_info).to eq "Adam <a@example.com>"
    end

    it "renders name and email for Adam" do
      user = User.new email: "b@example.com", name: "Brad"
      expect(user.contact_info).to eq "Brad <b@example.com>"
    end
  end
end
