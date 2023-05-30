class SearchController < ApplicationController
  def index
    @post = Post.new # hoặc tìm post phù hợp với trang tìm kiếm
    @query = Post.ransack(params[:q])
    @posts = @query.result(distinct: true)
    @user = current_user # hoặc tìm user phù hợp với trang tìm kiếm
  end
end
