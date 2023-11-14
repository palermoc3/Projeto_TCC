# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :authorize_admin, only: [:update_role]
  load_and_authorize_resource
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
    if @user.role == 1
      @administrator = Administrator.new(administrator_params)
      @administrator.user = @user
    end
    if @user.role == 2
      @employee = Employee.new(employee_params)
      @employee.user = @user

    end
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

  def update_role
    if @user.update(user_params_for_role_update)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :cpf, :email, :role, :state, :cep, :street, :number)
  end

  def administrator_params
    params.require(:user).permit(:name, :cpf, :email, :state, :cep, :street, :number).merge(cnpj: '98765432100001')
  end

  def employee_params
    params.require(:user).permit(:ctps, :salary_base, :hours, :commission_percent)
  end

  def authorize_admin
    return if current_user&.admin?

    render json: { error: 'Unauthorized' }, status: :unauthorized
  end

  def user_params_for_role_update
    params.require(:user).permit(:role)
  end
end
