class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :follows, :followers]
  before_action :set_user, only: [:show, :edit, :update, :mypege, :follows, :followers]
  before_action :move_to_index, only: [:mypege]

  def show
  end

  def edit
  end

  def update
  end

  def mypege
  end

  def likes
  end

  def follows
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @user.id
      redirect_to root_path
    end
  end

end
