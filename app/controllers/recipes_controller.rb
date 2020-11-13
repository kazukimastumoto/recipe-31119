class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destory]
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
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  def search
    @recipes = Recipe.search(params[:keyword])
  end

  private
  def recipe_params
    params.require(:recipe).permit(:image, :price, :title, :body).merge(user_id: current_user.id)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def move_to_index
    unless @recipe.user_id == current_user.id
      redirect_to action: :index
    end
end
end
