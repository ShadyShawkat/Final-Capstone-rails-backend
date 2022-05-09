require "test_helper"

class ReservationsControllersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservations_controller = reservations_controllers(:one)
  end

  test "should get index" do
    get reservations_controllers_url, as: :json
    assert_response :success
  end

  test "should create reservations_controller" do
    assert_difference("ReservationsController.count") do
      post reservations_controllers_url, params: { reservations_controller: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show reservations_controller" do
    get reservations_controller_url(@reservations_controller), as: :json
    assert_response :success
  end

  test "should update reservations_controller" do
    patch reservations_controller_url(@reservations_controller), params: { reservations_controller: {  } }, as: :json
    assert_response :success
  end

  test "should destroy reservations_controller" do
    assert_difference("ReservationsController.count", -1) do
      delete reservations_controller_url(@reservations_controller), as: :json
    end

    assert_response :no_content
  end
end
