class NewsPostsController < ApplicationController
  def index
    @news_posts = NewsPost.all
    render json: @news_posts
  end

  def show
    @news_post = NewsPost.find(params[:id])
    render json: @news_post
  end
end
