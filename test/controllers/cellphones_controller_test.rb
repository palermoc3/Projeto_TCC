# frozen_string_literal: true

require 'test_helper'

class CellphonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cellphone = cellphones(:one)
  end

  test 'should get index' do
    get cellphones_url, as: :json
    assert_response :success
  end

  test 'should create cellphone' do
    assert_difference('Cellphone.count') do
      post cellphones_url,
           params: { cellphone: { kind: @cellphone.kind, number: @cellphone.number, user_id: @cellphone.user_id } }, as: :json
    end

    assert_response :created
  end

  test 'should show cellphone' do
    get cellphone_url(@cellphone), as: :json
    assert_response :success
  end

  test 'should update cellphone' do
    patch cellphone_url(@cellphone),
          params: { cellphone: { kind: @cellphone.kind, number: @cellphone.number, user_id: @cellphone.user_id } }, as: :json
    assert_response :success
  end

  test 'should destroy cellphone' do
    assert_difference('Cellphone.count', -1) do
      delete cellphone_url(@cellphone), as: :json
    end

    assert_response :no_content
  end
end
