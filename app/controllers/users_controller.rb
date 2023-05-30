class UsersController < ApplicationController
  before_action :set_user
  def profile
    if @user.views.nil?
      @user.views = 0
    end
    @user.update(views: @user.views + 1)
    @posts = @user.posts.order(create_at: :desc)
  end
  private
  def set_user
      @user = User.find(params[:id])
  end
end
