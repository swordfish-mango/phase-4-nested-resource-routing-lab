class ItemsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    items = Item.all
    render json: items, include: :user
  end

  def show
    items = User.find(params[:user_id]).items.find(params[:id])
    render json: items, include: :user
  end

  def create
    user = User.find(params[:user_id])
    if user == nil
      render json: { error: "User not found" }, status: :not_found
    else
      item = Item.create(params.permit(:name,:description,:price,:user_id))
      render json: item, status: :created
    end
  end

  private

  def render_not_found_response
    render json: { error: "Item not found" }, status: :not_found
  end

end
