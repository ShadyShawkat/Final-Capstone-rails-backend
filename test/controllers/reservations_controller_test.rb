require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservations = reservations(:one)
  end

  test 'should get index' do
    get reservations_url, as: :json
    assert_response :success
  end

  test 'should create reservations' do
    assert_difference('ReservationsController.count') do
      post reservations_url, params: { reservations: {} }, as: :json
    end

    assert_response :created
  end

  test 'should show reservations' do
    get reservations_url(@reservations), as: :json
    assert_response :success
  end

  test 'should update reservations' do
    patch reservations_url(@reservations), params: { reservations: {} }, as: :json
    assert_response :success
  end

  test 'should destroy reservations' do
    assert_difference('ReservationsController.count', -1) do
      delete reservations_url(@reservations), as: :json
    end

    assert_response :no_content
  end
end
