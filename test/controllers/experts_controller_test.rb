require 'test_helper'

class ExpertsControllerTest < ActionController::TestCase
  setup do
    @expert = experts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expert" do
    assert_difference('Expert.count') do
      post :create, expert: { email: @expert.email, password_digest: @expert.password_digest, phone_number: @expert.phone_number, university: @expert.university, username: @expert.username }
    end

    assert_redirected_to expert_path(assigns(:expert))
  end

  test "should show expert" do
    get :show, id: @expert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expert
    assert_response :success
  end

  test "should update expert" do
    patch :update, id: @expert, expert: { email: @expert.email, password_digest: @expert.password_digest, phone_number: @expert.phone_number, university: @expert.university, username: @expert.username }
    assert_redirected_to expert_path(assigns(:expert))
  end

  test "should destroy expert" do
    assert_difference('Expert.count', -1) do
      delete :destroy, id: @expert
    end

    assert_redirected_to experts_path
  end
end
