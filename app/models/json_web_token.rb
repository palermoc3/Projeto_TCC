# frozen_string_literal: true

class JsonWebToken
  Secret = '@P2sSkl%234hj'
  def self.encode(payload)
    JWT.encode(payload, Secret)
  end

  def self.decode(token)
    JWT.decode(token, Secret)
  rescue StandardError
    nil
  end
end
