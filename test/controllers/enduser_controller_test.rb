require 'test_helper'

class EnduserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get enduser_index_url
    assert_response :success
  end

  test "should get show" do
    get enduser_show_url
    assert_response :success
  end

  test "should get edit" do
    get enduser_edit_url
    assert_response :success
  end

end
