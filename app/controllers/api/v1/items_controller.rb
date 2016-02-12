module Api
  module V1
    class ItemsController < ApplicationController
      before_action :authenticate_request

      def create
        item = Item.new(item_params)
        if item.save
          render json: item, status: 201
        else
          render json: {
            feedback: "Item not created"
          },
                 status: :unprocessable_entity
        end
      end

      def update
        item = Item.find_by(id: params[:id])
        if item.update_attributes item_params
          render json: item, status: 200
        else
          render json: {
            feedback: "Item could not be updated"
          },
                 status: :unprocessable_entity
        end
      end

      def destroy
        item = Item.find_by(id: params[:id])
        if item.nil?
          render json: { feedback: "Item does not exist" }, status: 404
        else
          item.destroy
          render json: {
            feedback: "Item successfully destroyed"
          },
                 status: 200
        end
      end

      private

      def item_params
        params.permit(:name, :done).merge(
          bucketlist_id: params[:bucketlist_id]
        )
      end
    end
  end
end
