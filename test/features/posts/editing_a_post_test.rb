require "test_helper"

class EditingAPostTest < Capybara::Rails::TestCase
  feature "Editing a Post" do
    scenario "submit updates to an existing post" do
      sign_in

      # Given an existing post
      visit post_path(posts(:post_example))

      # When I click edit and submit changed data
      click_on "Edit"
      fill_in "Title", with: "Becoming a Web Developer"
      click_on "Update Post"

      # Then the post is updated
      page.text.must_include "Post was successfully updated"
      page.text.must_include "Web Developer"
    end
  end
end
