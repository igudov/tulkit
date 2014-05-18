require 'test_helper'

class MyJobsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
