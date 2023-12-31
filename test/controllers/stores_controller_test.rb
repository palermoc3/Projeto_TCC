# frozen_string_literal: true

require 'test_helper'

class StoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store = stores(:one)
  end

  test 'should get index' do
    get stores_url, as: :json
    assert_response :success
  end

  test 'should create store' do
    assert_difference('Store.count') do
      post stores_url,
           params: { store: { administrator_id: @store.administrator_id, kind: @store.kind, payroll_day: @store.payroll_day, theme: @store.theme } }, as: :json
    end

    assert_response :created
  end

  test 'should show store' do
    get store_url(@store), as: :json
    assert_response :success
  end

  test 'should update store' do
    patch store_url(@store),
          params: { store: { administrator_id: @store.administrator_id, kind: @store.kind, payroll_day: @store.payroll_day, theme: @store.theme } }, as: :json
    assert_response :success
  end

  test 'should destroy store' do
    assert_difference('Store.count', -1) do
      delete store_url(@store), as: :json
    end

    assert_response :no_content
  end
end
