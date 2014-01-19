require "test_helper"

class ZerbThemeLoadedTest < Capybara::Rails::TestCase
  test "check for loaded theme" do
    visit root_path
    page.body.must_include "social-icon"
  end
end
