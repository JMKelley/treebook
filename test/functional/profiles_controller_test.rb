require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:jonathan).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "Should say 404 if it does not exist" do
    get :show, id: "Doesn't Exist"
    assert_response :not_found
  end

  test "Variables are assigned on successful profile viewing" do
  	get :show, id: users(:jonathan).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "only show the correct users statuses" do
  	get :show, id: users(:jonathan).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:jonathan), status.user
  	end
  end


end
