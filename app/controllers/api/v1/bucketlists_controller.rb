module Api
  module V1
    class BucketlistsController < ApplicationController
      before_action :authenticate_request

      def index
        all_bucketlists = current_user.bucketlists
        bucketlists = Search.new(all_bucketlists, params).choose
        display Pagination.new(bucketlists, params).start
      end

      def create
        bucketlist = Bucketlist.new(bucketlist_params)
        if bucketlist.save
          render json: bucketlist, status: 201
        else
          render json: {
            feedback: "Bucketlist not created"
          },
                 status: :unprocessable_entity
        end
      end

      def show
        bucketlist = current_user.bucketlists.find_by(id: params[:id])
        if bucketlist
          render json: bucketlist, status: 200
        else
          render json: { feedback: "Bucketlist not found" }, status: 404
        end
      end

      def update
        bucketlist = Bucketlist.find_by(id: params[:id])
        update = bucketlist.update_attributes(name: params[:name])
        if update
          render json: bucketlist, status: 200
        else
          render json: { feedback: "Could not update bucketlist" }, status: 422
        end
      end

      def destroy
        bucketlist = current_user.bucketlists.find_by(id: params[:id])
        if bucketlist.nil?
          render json: { feedback: "Bucketlist does not exist" }, status: 404
        elsif bucketlist.destroy
          render json: {
            feedback: "Bucketlist successfully destroyed"
          },
                 status: 200
        end
      end

      private

      def bucketlist_params
        params.permit(:name).merge(user_id: current_user.id)
      end

      def display(bucketlists)
        if bucketlists.empty?
          render json: { feedback: "Bucketlist empty" }, status: 404
        else
          render json: bucketlists, root: false, status: 200
        end
      end
    end
  end
end
