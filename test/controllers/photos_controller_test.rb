require 'test_helper'

class PhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get photos_edit_url
    assert_response :success
  end

  test "should get update" do
    get photos_update_url
    assert_response :success
  end

end
