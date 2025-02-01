module JsonWebToken

	SECRET_KEY = Rails.application.secret_key_base || ENV["JWT_SECRET_KEY"]

	def self.encode(payload, exp = 24.hours.from_now)
		payload[:exp] = exp.to_i
		payload[:jti] = SecureRandom.uuid
		JWT.encode(payload, SECRET_KEY)
	end

	def self.decode(token)
	  begin
	    decoded = JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')[0]
	    HashWithIndifferentAccess.new(decoded)
	  rescue JWT::ExpiredSignature
	    Rails.logger.error("JWT Decode Error: Token has expired")
	    nil
	  rescue JWT::DecodeError => e
	    Rails.logger.error("JWT Decode Error: #{e.message}")
	    nil
	  end
    end
end