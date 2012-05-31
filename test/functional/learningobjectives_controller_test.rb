require 'test_helper'

class LearningobjectivesControllerTest < ActionController::TestCase
  setup do
    @learningobjective = learningobjectives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:learningobjectives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create learningobjective" do
    assert_difference('Learningobjective.count') do
      post :create, learningobjective: { creator: @learningobjective.creator, department_id: @learningobjective.department_id, objective: @learningobjective.objective }
    end

    assert_redirected_to learningobjective_path(assigns(:learningobjective))
  end

  test "should show learningobjective" do
    get :show, id: @learningobjective
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @learningobjective
    assert_response :success
  end

  test "should update learningobjective" do
    put :update, id: @learningobjective, learningobjective: { creator: @learningobjective.creator, department_id: @learningobjective.department_id, objective: @learningobjective.objective }
    assert_redirected_to learningobjective_path(assigns(:learningobjective))
  end

  test "should destroy learningobjective" do
    assert_difference('Learningobjective.count', -1) do
      delete :destroy, id: @learningobjective
    end

    assert_redirected_to learningobjectives_path
  end
end
