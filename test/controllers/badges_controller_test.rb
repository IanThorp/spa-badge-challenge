require 'test_helper'

class BadgesControllerTest < ActionController::TestCase
  setup do
    @badge = badges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:badges)
  end

  test "should create badge" do
    assert_difference('Badge.count') do
      post :create, badge: { title: @badge.title, votes: @badge.votes }
    end

    assert_response 201
  end

  test "should show badge" do
    get :show, id: @badge
    assert_response :success
  end

  test "should update badge" do
    put :update, id: @badge, badge: { title: @badge.title, votes: @badge.votes }
    assert_response 204
  end

  test "should destroy badge" do
    assert_difference('Badge.count', -1) do
      delete :destroy, id: @badge
    end

    assert_response 204
  end
end
