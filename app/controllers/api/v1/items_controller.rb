module Api
  module V1
    class ItemsController < ApplicationController
      before_action :authenticate_request
      def create
        item = Item.new(item_params)
        if item.save
          render json: item
        else
          render json: {
            feedback: "Item not created"
          }, status: :unprocessable_entity
        end
      end

      def update
        item = Item.find_by_id(params[:id])
        if item.update_attributes item_params
          render json: item
        else
          render json: {
            feedback: "Item could not be updated"
          }, status: :unprocessable_entity
        end
      end

      private

      def item_params
        params.permit(:description, :done).merge(
          bucketlist_id: params[:bucketlist_id]
        )
      end
    end
  end
end
