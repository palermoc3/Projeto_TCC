class ApplicationController < ActionController::API
    def current_user
        if decode.present?
            user = User.find(decode["user_id"])
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
