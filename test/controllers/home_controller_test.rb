require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should get home" do
    #get :home
    get home_index_path
    assert_response :success
    assert_select "title", "Net Show Video"
  end


end
