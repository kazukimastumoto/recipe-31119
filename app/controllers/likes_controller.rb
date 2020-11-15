class LikesController < ApplicationController
  def create
    Like.create(user_id: current_user.id, recipe_id: params[:id])
    redirect_back(fallback_location: root_path)

    recipe =Recipe.find(params[:id])
    recipe.create_notification_like!(current_user)
  end

  def destroy
    Like.find_by(user_id: current_user.id, recipe_id: params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end
end
