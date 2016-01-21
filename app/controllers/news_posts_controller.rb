class NewsPostsController < ApplicationController
  def index
    @news_posts_links = NewsPost.all.news_links_format
    render json: @news_posts_links
  end

  def show
    @news_post = NewsPost.publish_ready.find(params[:id])
    render json: @news_post
  end
end
