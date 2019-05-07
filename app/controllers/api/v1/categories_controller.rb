class Api::V1::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def create
    if params[:name] != ""
      newCat = Category.find_or_create_by(name: params[:name])
      json = newCat
    else
      json = {errors: "something went wrong.", success: false}
    end
    render json: json
  end

  def destroy

  end

  # private
  #
  # def category_params
  #   params.require(:category).permit(:name)
  # end
end
