require 'test_helper'

class ViewsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get views_create_url
    assert_response :success
  end

end
