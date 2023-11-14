# frozen_string_literal: true

class ApplicationController < ActionController::API
  def current_user
    return nil unless decode.present?

    User.find(decode['user_id'])
  end

  def decode
    return nil unless auth_token.present?

    decoded_array = JsonWebToken.decode(auth_token)
    decoded_array[0]
  end

  def auth_token
    token = request.headers['Authorization']
    return nil if token.nil?

    token.split(' ').last
  end
end
