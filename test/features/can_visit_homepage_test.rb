require "test_helper"

class CanVisitHomepageTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
    assert_content page, "Joel Smith"
    refute_content page, "Goobye All!"
  end
end
