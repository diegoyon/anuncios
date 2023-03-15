require "test_helper"

class SplashControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get splash_home_url
    assert_response :success
  end
end
