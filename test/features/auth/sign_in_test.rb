require "test_helper"

class SignUpTest < Capybara::Rails::TestCase
  feature "sigining in via twitter" do
    scenario "sign in with twitter works" do
      visit root_path
      click_on "Log In"
      OmniAuth.config.test_mode = true
      Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
      Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
      OmniAuth.config.add_mock(:twitter,
                                {
                                uid: '12345',
                                info: { nickname: 'test_twitter_user'},
                                })
      click_on "Sign in with Twitter"
      save_and_open_page
      page.must_have_content "test_twitter_user, you are signed in!"
    end
  end
end
