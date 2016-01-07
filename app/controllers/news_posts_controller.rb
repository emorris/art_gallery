class NewsPostsController < ApplicationController
  def index
    @news_posts = NewsPost.all.publish_ready
    render json: @news_posts
  end

  def show
    @news_post = NewsPost.find(params[:id]).publish_ready
    render json: @news_post
  end
end
