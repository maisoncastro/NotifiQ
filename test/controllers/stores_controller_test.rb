require 'test_helper'

class StoresControllerTest < ActionDispatch::IntegrationTest
  test "should get qrcode" do
    get stores_qrcode_url
    assert_response :success
  end

  test "should get update" do
    get stores_update_url
    assert_response :success
  end

  test "should get edit" do
    get stores_edit_url
    assert_response :success
  end

  test "should get show" do
    get stores_show_url
    assert_response :success
  end

end
