require 'test_helper'

class ElementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get elements_new_url
    assert_response :success
  end

  test "should get create" do
    get elements_create_url
    assert_response :success
  end

end
