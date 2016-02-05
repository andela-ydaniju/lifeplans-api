module Api
  module V1
    class UsersController < ApplicationController
      def create
        user = User.new(user_params)
        if user.save
          render json: { feedback: "You are welcome to Lifeplans" }
        else
          render json: { feedback: user.errors }, status: :unprocessable_entity
        end
      end

      def show
        respond_with User.find(params[:id])
      end

      private

      def user_params
        params.permit :username, :password, :password_confirmation
      end
    end
  end
end
