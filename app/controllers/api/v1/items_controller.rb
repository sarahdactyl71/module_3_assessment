class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    Item.find(params[:id]).destroy
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    binding.pry
    params.require(:item).permit(:name, :description, :image_url)
  end
end
