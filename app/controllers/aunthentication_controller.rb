# frozen_string_literal: true

class AunthenticationController < ApplicationController
  def login
    user = User.find_by(email: params[:user][:email])
    authenticated_user = user&.authenticate(params[:user][:password])

    if authenticated_user
      jwt_token = generate_jwt(authenticated_user)
      render json: { token: jwt_token }
    else
      render json: { message: "Email ou senha incorretas" }, status: :unauthorized
    end
  end

  def sign_up
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :cpf, :email, :password, :password_confirmation, :role, :state, :cep, :street,
                                 :number)
  end

  def generate_jwt(user)
    JWT.encode({ id: user.id, exp: 1.days.from_now.to_i }, 'P@1kl+)(oi)AS')
  end
end
