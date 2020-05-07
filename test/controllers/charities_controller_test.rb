require 'test_helper'

class CharitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get charities_index_url
    assert_response :success
  end

  test "should get new" do
    get charities_new_url
    assert_response :success
  end

  test "should get create" do
    get charities_create_url
    assert_response :success
  end

  test "should get show" do
    get charities_show_url
    assert_response :success
  end

  test "should get update" do
    get charities_update_url
    assert_response :success
  end

  test "should get destroy" do
    get charities_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get charities_edit_url
    assert_response :success
  end

end
