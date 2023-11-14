class ApplicationController < ActionController::API
  rescue_from CanCan::AccessDenied do |exception|
      render json: {error: "Acesso negado"}, status: 403
  end
  def current_user
      if decode.present?
           User.find(decode["user_id"])
      else
          return nil
      end
  end

  def decode
      if auth_token.present?
          decoded_array = JsonWebToken.decode(auth_token) 
          return decoded_array[0]
      else
          return nil
      end

  end

  def auth_token
      token = request.headers["Authorization"]
      return nil if token.nil?
      token.split(" ").last
  end
end
