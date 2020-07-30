require 'test_helper'

class ViewsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get create_path, params: { id: "14" }
    assert_response :success
  end

end
