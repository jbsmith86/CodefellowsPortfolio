require "test_helper"

class CanVisitHomepageTest < Capybara::Rails::TestCase
  test "Visit home page" do
    visit root_path
    assert_content page, "Joel Smith"
  end
end
