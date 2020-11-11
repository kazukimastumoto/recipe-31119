class RecipesController < ApplicationController
  def index
    @recipes = Recipe.order('created_at DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.new(recipe_params)
    if recipe.save
      redirect_to root_path
    else
      render :new
    end

    def show
      @recipe = Recipe.find(params[:id])
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:image, :price, :title, :body).merge(user_id: current_user.id)
  end
end
