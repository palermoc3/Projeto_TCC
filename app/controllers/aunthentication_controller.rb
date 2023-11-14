class AunthenticationController < ApplicationController
  def login
    @user = User.find_by(email: params[:user][:email])
    if @user.authenticate(params[:user][:password])
      #Gerar um token autenticavel
      token = JsonWebToken.encode({user_id:@user.id})
      render json: {token: token}
    else
      render json: {error:"Não foi possivel fazer o login"}, status: 401
    end
  end

  def signup
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: @user.errors, status: 422
    end
  end

  def confirm
    if params[:validation_token].present?
      @user=User.find_by(validation_token: params[:validation_token])
      if @user.present?
        if @user.validate_user?(params[:validation_token])
          render json:@user
        else
          render json:{error:"Esse token ja expirou"},status:422
        end
      else
        render json:{error: "usuario não existe"},status: 404
      end
    else
      render json: {error: "Operação inválida"}, status: 400
    end
  end


  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :cpf, :email, :password, :password_confirmation, :role, :state, :cep, :street,
                                 :number)
  end
end
