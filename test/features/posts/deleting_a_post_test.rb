require "test_helper"

class DeletingAPostTest < Capybara::Rails::TestCase
  feature "Deleting a Post" do
    scenario "post is deleted with a click" do
      sign_in(:editor)

      # Given an existing post
      visit posts_path

      # When the delete link is clicked
      within(page.all('tr')[1]) do
        click_on "Destroy"
      end

      # Then the post is deleted
      page.wont_have_content "Becoming a Code Fellow"
    end
  end
end
