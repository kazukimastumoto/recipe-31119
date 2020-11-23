class LikesController < ApplicationController
  before_action :recipe_params


  def create
    Like.create(user_id: current_user.id, recipe_id: params[:id])
    recipe =Recipe.find(params[:id])
    recipe.create_notification_like!(current_user)
  end

  def destroy
    Like.find_by(user_id: current_user.id, recipe_id: params[:id]).destroy
  end

  private

  def recipe_params
    @recipe = Recipe.find(params[:id])
  end

end
