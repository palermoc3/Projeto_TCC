# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.role == 3
      @client = Client.new(user_params.except(:role))
      @user = @client.build_user(user_params.slice(:name, :cpf, :email, :state, :cep, :street, :number))
    end

   if @user.save
      if @user.is_a?(Client)
        render json: @user, status: :created, location: @user, notice: 'Client created successfully.'
      else
        render json: @user, status: :created, location: @user, notice: 'User was successfully created.'
      end
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :cpf, :email, :role, :state, :cep, :street, :number)
  end
end
