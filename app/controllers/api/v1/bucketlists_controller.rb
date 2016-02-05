module Api
  module V1
    class BucketlistsController < ApplicationController
      before_action :authenticate_request
      def index
        all_bucketlist = current_user.bucketlists.all
        if all_bucketlist.any?
          render json: all_bucketlist
        else
          render json: { feedback: "You've got no bucketlists" }, status: 404
        end
      end

      def create
        bucketlist = Bucketlist.new(bucketlist_params)
        if bucketlist.save
          render json: bucketlist
        else
          render json: {
            feedback: "Bucketlist not created"
          }, status: :unprocessable_entity
        end
      end

      def show
        bucketlist = current_user.bucketlists.find_by_id(params[:id])
        if bucketlist
          render json: bucketlist
        else
          render json: { feedback: "Bucketlist not found" }, status: 404
        end
      end

      def update
        bucketlist = current_user.bucketlists.find_by_id(params[:id])
        update = bucketlist.update_attributes(title: params[:title])
        if update
          render json: bucketlist
        else
          render json: { feedback: "Could not update bucketlist" }, status: 422
        end
      end

      def destroy
        bucketlist = current_user.bucketlists.find_by_id(params[:id])
        if bucketlist.nil?
          render json: { feedback: "Bucketlist does not exist" }, status: 422
        elsif bucketlist.destroy
          render json: { feedback: "Bucketlist successfully destroyed" }
        else
          render json: { feedback: "Bucketlist not found" }, status: 404
        end
      end

      private

      def bucketlist_params
        params.permit(:title).merge(user_id: current_user.id)
      end
    end
  end
end
