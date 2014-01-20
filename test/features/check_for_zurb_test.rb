require "test_helper"

class CheckForZurbTest < Capybara::Rails::TestCase
  feature "Using Zerb for styling" do
    scenario "check to see if zerb is loaded" do
      visit posts_path
      page.body.must_include "columns"
      page.source.must_include "foundation_and_overrides.css"
    end
  end
end
