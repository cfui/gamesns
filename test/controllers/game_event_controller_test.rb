require 'test_helper'

class GameEventControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get game_event_index_url
    assert_response :success
  end

  test "should get new" do
    get game_event_new_url
    assert_response :success
  end

  test "should get edit" do
    get game_event_edit_url
    assert_response :success
  end

  test "should get show" do
    get game_event_show_url
    assert_response :success
  end

end
