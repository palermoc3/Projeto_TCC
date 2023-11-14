# frozen_string_literal: true

class CellphonesController < ApplicationController
  before_action :set_cellphone, only: %i[show update destroy]

  # GET /cellphones
  def index
    @cellphones = Cellphone.all

    render json: @cellphones
  end

  # GET /cellphones/1
  def show
    render json: @cellphone
  end

  # POST /cellphones
  def create
    @cellphone = Cellphone.new(cellphone_params)

    if @cellphone.save
      render json: @cellphone, status: :created, location: @cellphone
    else
      render json: @cellphone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cellphones/1
  def update
    if @cellphone.update(cellphone_params)
      render json: @cellphone
    else
      render json: @cellphone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cellphones/1
  def destroy
    @cellphone.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cellphone
    @cellphone = Cellphone.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cellphone_params
    params.require(:cellphone).permit(:number, :kind, :user_id)
  end
end
