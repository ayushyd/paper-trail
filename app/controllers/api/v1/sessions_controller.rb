module Api
  module V1
    class SessionsController < Devise::SessionsController

      skip_before_action :authenticate_token, only: [:create]
      skip_before_action :verify_signed_out_user, only: [:destroy]
      
      def create
        user = User.find_for_database_authentication(email: params[:user][:email])

        if user&.valid_password?(params[:user][:password])
          token = JsonWebToken.encode(user_id: user.id)

          render json: { message: "Logged in successfully", user: user, token: token }, status: :ok
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end

        def destroy
          token = request.headers["Authorization"]&.split(' ')&.last

          if token
            decoded_token = JsonWebToken.decode(token)

            if decoded_token
              jti = decoded_token[:jti]
              if jti
                JwtDenylist.create!(jti: jti)
                render json: { message: "Logged out successfully" }, status: :ok
              else
                render json: { error: "Invalid token structure" }, status: :unauthorized
              end
            else
              render json: { error: "Invalid token" }, status: :unauthorized
            end
          else
            render json: { error: "No token provided" }, status: :unauthorized
          end
        end
   end

  end
end
