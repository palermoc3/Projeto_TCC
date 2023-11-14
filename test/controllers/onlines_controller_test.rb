require "test_helper"

class OnlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @online = onlines(:one)
  end

  test "should get index" do
    get onlines_url, as: :json
    assert_response :success
  end

  test "should create online" do
    assert_difference("Online.count") do
      post onlines_url, params: { online: { packPrice: @online.packPrice, packSize: @online.packSize, purchase_id: @online.purchase_id, receive: @online.receive } }, as: :json
    end

    assert_response :created
  end

  test "should show online" do
    get online_url(@online), as: :json
    assert_response :success
  end

  test "should update online" do
    patch online_url(@online), params: { online: { packPrice: @online.packPrice, packSize: @online.packSize, purchase_id: @online.purchase_id, receive: @online.receive } }, as: :json
    assert_response :success
  end

  test "should destroy online" do
    assert_difference("Online.count", -1) do
      delete online_url(@online), as: :json
    end

    assert_response :no_content
  end
end
