module Api
  module V1
    class SessionsController < ApplicationController
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

      private

      def authentication_payload(user)
        return nil unless user && user.id
        {
          auth_token: AuthToken.encode(user_id: user.id),
          user: { id: user.id, username: user.username }
        }
      end
    end
  end
end
