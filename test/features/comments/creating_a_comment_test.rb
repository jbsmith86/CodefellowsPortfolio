require "test_helper"

class CreatingAPostTest < Capybara::Rails::TestCase

  feature "Creating a blog comment" do

    scenario "submit form data to create a new blog comment" do
      visit new_comment_path

      fill_in "Name", with: comments(:comment).author
      fill_in "Url", with: comments(:comment).author_url
      fill_in "Email", with: comments(:comment).author_email
      fill_in "Comment", with: comments(:comment).content
      click_on "Create Comment"
    end

    scenario "only editors/authors can approve blog comments" do
      # Given an editor's account
      sign_in(:editor)

      # When I visit the new page
      visit post_path(posts(:post_example))

      # There is a checkbox for published
      page.must_have_field('Approved')

      # When I submit the form
      fill_in "Name", with: comments(:comment).author
      fill_in "Url", with: comments(:comment).author_url
      fill_in "Email", with: comments(:comment).author_email
      fill_in "Comment", with: comments(:comment).content
      check "Approved"
      click_on "Create Comment"

      visit post_path(posts(:post_example))

      # Then the published post should be shown
      page.text.must_include "Status: Approved"
    end
  end
end
