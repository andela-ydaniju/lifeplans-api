module Api
  module V1
    class BucketlistsController < ApplicationController
      def create
        @bucketlist = Bucketlist.new(bucketlist_params)
        if @bucketlist.save
          render json: @bucketlist
        else
          render json: {
            feedback: @bucketlist.errors
          }, status: :unprocessable_entity
        end
      end

      def show
        @bucketlist = Bucketlist.find_by_id(params[:id])
        if @bucketlist
          render json: @bucketlist
        else
          render json: { feedback: "Bucketlist not found" }, status: 404
        end
      end

      private

      def bucketlist_params
        params.permit :title, :user_id
      end
    end
  end
end
