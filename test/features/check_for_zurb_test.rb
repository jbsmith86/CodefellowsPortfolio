require "test_helper"

class CheckForZurbTest < Capybara::Rails::TestCase
  feature "Using Zerb for styling" do
    scenario "check to see if zerb is loaded" do
      visit root_path
      puts page.all
    end
  end
end
