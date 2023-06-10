require "test_helper"

class Api::V1::ProjectSetsControllerTest < ActionController::TestCase

  test "#index creates a project set based on set_token and calculates result" do
    get :index
    assert_equal(assigns(:projects).count, 11)
  end
  
end
