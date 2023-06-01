class SearchController < ApplicationController
  def index
    @post = Post.new # Find the post
    @query = Post.ransack(params[:q])
    @posts = @query.result(distinct: true)
    @user = current_user # Find the user
  end
end
