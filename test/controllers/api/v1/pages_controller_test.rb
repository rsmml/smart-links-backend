require 'test_helper'

class Api::V1::PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get api_v1_pages_home_url
    assert_response :success
  end

end
