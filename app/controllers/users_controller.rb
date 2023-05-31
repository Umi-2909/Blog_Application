class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end
  def profile
    @user = User.find(params[:id])
    if @user.views.nil?
      @user.views = 0
    end
    @user.update(views: @user.views + 1)
    @posts = @user.posts.order(create_at: :desc)
  end

  private

  def set_user
    if params[:id].present?
    @user = User.find(params[:id])
    end
  end
end
