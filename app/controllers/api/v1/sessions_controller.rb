module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate_request!, only: :login
      def login
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
          render json: authentication_payload(user)
        else
          render json: {
            feedback: ["Invalid username or password"]
          }, status: :unauthorized
        end
      end

      def logout
        # user = User.find_by_username(params[:username])
        # current_user = user if decoded_auth_token.include?(user.id)
        if current_user.nil?
          render json:  { feedback: "No current user" }
        else
          current_user[:auth_token] = nil
          render json: { feedback: "You are successfully logged out" }
        end
      end

      private

      def authentication_payload(user)
        return nil unless user && user.id
        {
          user: {
            user_id: user.id,
            username: user.username,
            auth_token: AuthToken.encode(user_id: user.id)
          }
        }
      end
    end
  end
end
