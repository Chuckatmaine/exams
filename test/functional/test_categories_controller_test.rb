require 'test_helper'

class TestCategoriesControllerTest < ActionController::TestCase
  setup do
    @test_category = test_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_category" do
    assert_difference('TestCategory.count') do
      post :create, test_category: { category_id: @test_category.category_id, test_id: @test_category.test_id }
    end

    assert_redirected_to test_category_path(assigns(:test_category))
  end

  test "should show test_category" do
    get :show, id: @test_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_category
    assert_response :success
  end

  test "should update test_category" do
    put :update, id: @test_category, test_category: { category_id: @test_category.category_id, test_id: @test_category.test_id }
    assert_redirected_to test_category_path(assigns(:test_category))
  end

  test "should destroy test_category" do
    assert_difference('TestCategory.count', -1) do
      delete :destroy, id: @test_category
    end

    assert_redirected_to test_categories_path
  end
end
