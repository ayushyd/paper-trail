class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_paper_trail_whodunnit

  skip_before_action :verify_authenticity_token

  before_action :authenticate_token

  private

  def authenticate_token
    token = request.headers['Authorization']&.split&.last

    if token.blank?
      render json: { error: "Token is missing" }, status: :unauthorized
      return
    end

    begin  
      decoded_token = JsonWebToken.decode(token)
      jti = decoded_token["jti"]

      if JwtDenylist.exists?(jti: jti)
        render json: { error: "Token has been blacklisted" }, status: :unauthorized
        return
      end

      @current_user = User.find_by(id: decoded_token["user_id"])

      unless @current_user
        render json: { error: "User not found" }, status: :unauthorized
      end
    rescue JWT::DecodeError
      render json: { error: "Invalid token" }, status: :unauthorized
    rescue JWT::ExpiredSignature
      render json: { error: "Token has expired" }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end
end
