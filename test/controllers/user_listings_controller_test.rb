require 'test_helper'

class UserListingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_listings_index_url
    assert_response :success
  end

  test "should get create" do
    get user_listings_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_listings_destroy_url
    assert_response :success
  end

end
