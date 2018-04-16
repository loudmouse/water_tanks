require 'test_helper'

class TankLocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tank_locations_new_url
    assert_response :success
  end

  test "should get create" do
    get tank_locations_create_url
    assert_response :success
  end

  test "should get edit" do
    get tank_locations_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get tank_locations_destroy_url
    assert_response :success
  end

  test "should get show" do
    get tank_locations_show_url
    assert_response :success
  end

  test "should get index" do
    get tank_locations_index_url
    assert_response :success
  end

end
