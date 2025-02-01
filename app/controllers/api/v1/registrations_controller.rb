module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      
        skip_before_action :authenticate_token, only: [:create]

      def index
        if current_user.present?
          render json: current_user, serializer: UserSerializer
        else
          render json: { message: 'No user signed in' }, status: :unauthorized
        end
      end

      def create
        @user = User.new(user_params)

        if @user.save
          render json: { message: "User was created successfully", user: UserSerializer.new(@user) }, status: :created
        else
          render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :role)
      end
    end
  end
end
