require "test_helper"

class VisitingThePostIndexTest < Capybara::Rails::TestCase
  feature "Visiting the Post Index" do
    scenario "with existing posts" do
      # Given existing posts
      Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")

      # When I visit /posts
      visit posts_path

      # Then the existing posts should be loaded
      page.text.must_include "Becoming a Code Fellow"
    end
  end
end
