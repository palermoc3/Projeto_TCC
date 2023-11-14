# frozen_string_literal: true

class ItemPurchasesController < ApplicationController
  before_action :set_item_purchase, only: %i[show update destroy]

  # GET /item_purchases
  def index
    @item_purchases = ItemPurchase.all

    render json: @item_purchases
  end

  # GET /item_purchases/1
  def show
    render json: @item_purchase
  end

  # POST /item_purchases
  def create
    @item_purchase = ItemPurchase.new(item_purchase_params)

    if @item_purchase.save
      render json: @item_purchase, status: :created, location: @item_purchase
    else
      render json: @item_purchase.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item_purchases/1
  def update
    if @item_purchase.update(item_purchase_params)
      render json: @item_purchase
    else
      render json: @item_purchase.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item_purchases/1
  def destroy
    @item_purchase.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item_purchase
    @item_purchase = ItemPurchase.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_purchase_params
    params.require(:item_purchase).permit(:quantity, :product_id, :purchase_id)
  end
end
