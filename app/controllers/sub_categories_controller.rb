# frozen_string_literal: true

class SubCategoriesController < ApplicationController
  before_action :set_sub_category, only: %i[show update destroy]
  load_and_authorize_resource

  # GET /sub_categories
  def index
    @sub_categories = SubCategory.all

    render json: @sub_categories
  end

  # GET /sub_categories/1
  def show
    render json: @sub_category
  end

  # POST /sub_categories
  def create
    @sub_category = SubCategory.new(sub_category_params)

    if @sub_category.save
      render json: @sub_category, status: :created, location: @sub_category
    else
      render json: @sub_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sub_categories/1
  def update
    if @sub_category.update(sub_category_params)
      render json: @sub_category
    else
      render json: @sub_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sub_categories/1
  def destroy
    @sub_category.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sub_category
    @sub_category = SubCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def sub_category_params
    params.require(:sub_category).permit(:name, :Category_id)
  end
end
