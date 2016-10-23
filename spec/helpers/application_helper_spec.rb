require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  describe "#li_link_to" do
    it "display <li class='nav-item'><a class='nav-link'></a></li> correctly" do
      # helper is an instance of ActionView::Base configured with the
      # EventsHelper and all of Rails' built-in helpers
      expect(helper.li_link_to 'Home', root_path).to eq "<li class=\"nav-item\"><a class=\" nav-link\" href=\"/\">Home</a></li>"
    end
  end
end
