require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  setup do
    @answer = answers(:one)
  end

  test "should create answer" do
    assert_difference('Answer.count') do
      post :create, answer: {  }
    end

    assert_redirected_to answer_path(assigns(:answer))
  end
end
