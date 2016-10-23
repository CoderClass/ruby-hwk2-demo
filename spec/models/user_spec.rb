require 'rails_helper'

RSpec.describe User, type: :model do
  let(:new_user) { User.new email: "a@example.com", name: "Adam" }
  let(:adam) { User.create! email: "a@example.com", name: "Adam", password: "asdf" }
  let(:brad) { User.create! email: "b@example.com", name: "Brad", password: "asdf" }

  describe "#contact_info" do
    it "renders name and email for Adam" do
      expect(new_user.contact_info).to eq "Adam <a@example.com>"
    end
  end

  describe "#non_friends" do
    it "is empty if there are no users" do
      adam
      expect(User.count).to eq 1
      expect(adam.non_friends).to eq []
    end

    it "includes brad if brad is a friend" do
      brad
      expect(adam.non_friends).to eq [brad]
    end
  end
end
