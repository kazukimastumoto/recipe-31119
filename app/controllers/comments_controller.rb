class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create
  def create
    if comment = Comment.create(comment_params)
      @recipe = comment.recipe
      @recipe.create_notification_comment!(current_user, comment.id)
      redirect_to "/recipes/#{comment.recipe.id}"
    else
      render "recipes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
  end
end
