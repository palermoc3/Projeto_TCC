class OnlinesController < ApplicationController
  before_action :set_online, only: %i[ show update destroy ]

  # GET /onlines
  def index
    @onlines = Online.all

    render json: @onlines
  end

  # GET /onlines/1
  def show
    render json: @online
  end

  # POST /onlines
  def create
    @online = Online.new(online_params)

    if @online.save
      render json: @online, status: :created, location: @online
    else
      render json: @online.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /onlines/1
  def update
    if @online.update(online_params)
      render json: @online
    else
      render json: @online.errors, status: :unprocessable_entity
    end
  end

  # DELETE /onlines/1
  def destroy
    @online.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_online
      @online = Online.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def online_params
      params.require(:online).permit(:packSize, :packPrice, :receive, :purchase_id)
    end
end
