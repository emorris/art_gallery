class Admin::NewsPostsController < Admin::ApplicationController
  before_action :set_news_post, except: [:index, :new, :create]

  def index
    @news_posts = NewsPost.all
  end

  def new
    @news_post = NewsPost.new
  end

  def create
    @news_post = NewsPost.new(news_post_params)
    if @news_post.save
      flash[:notice] = "NewsPost : #{@news_post} has been created."
      redirect_to admin_news_posts_path
    else
      flash[:alert] = "NewsPost : #{@news_post} has failed to be created."
      render 'new'
    end
  end

  def destroy
    if @news_post.destroy
      flash[:notice] = "NewsPost: #{@news_post} has been deleted."
      redirect_to admin_news_posts_path
    else
      flash[:alert] = "NewsPost: #{@news_post} has failed to be deleted."
      redirect_to admin_news_posts_path
    end
  end

  def edit
  end

  def update
    if @news_post.update(news_post_params)
      flash[:notice] = "NewsPost: #{@news_post} has been updated."
      redirect_to admin_news_posts_path
    else
      flash.now[:alert] = "NewsPost: #{@news_post} has failed to update."
      render 'edit'
    end
  end

  private

  def set_news_post
    @news_post = NewsPost.find(params[:id])
  end

  def news_post_params
    params.require(:news_post).permit(:title, :text, :publish_date)
  end
end
