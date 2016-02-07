module Api
  module V1
    class SessionsController < ApplicationController
      before_action :authenticate_request, only: [:logout]

      def login
        command = AuthenticateUser.call(params[:username], params[:password])

        if command.success?
          render json: command.result
        else
          render json: command.errors, status: :unauthorized
        end
      end

      def logout
        current_user.update_attribute(:auth_token, nil)
        render json: { "message" => "You're succesfully logged out" }
      end
    end
  end
end
