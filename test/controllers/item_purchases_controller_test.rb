# frozen_string_literal: true

require 'test_helper'

class ItemPurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_purchase = item_purchases(:one)
  end

  test 'should get index' do
    get item_purchases_url, as: :json
    assert_response :success
  end

  test 'should create item_purchase' do
    assert_difference('ItemPurchase.count') do
      post item_purchases_url,
           params: { item_purchase: { product_id: @item_purchase.product_id, purchase_id: @item_purchase.purchase_id, quantity: @item_purchase.quantity } }, as: :json
    end

    assert_response :created
  end

  test 'should show item_purchase' do
    get item_purchase_url(@item_purchase), as: :json
    assert_response :success
  end

  test 'should update item_purchase' do
    patch item_purchase_url(@item_purchase),
          params: { item_purchase: { product_id: @item_purchase.product_id, purchase_id: @item_purchase.purchase_id, quantity: @item_purchase.quantity } }, as: :json
    assert_response :success
  end

  test 'should destroy item_purchase' do
    assert_difference('ItemPurchase.count', -1) do
      delete item_purchase_url(@item_purchase), as: :json
    end

    assert_response :no_content
  end
end
