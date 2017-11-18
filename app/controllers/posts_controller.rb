class PostsController < ApplicationController
  before_action :target_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: posts_params[:title], content: posts_params[:content])
    if @post.save
      flash[:success] = '投稿しました'
      redirect_to root_path
    else
      render 'posts/new'
    end

  end

  def edit
  end

  def update
    if @post.update_attributes(posts_params)
      flash[:success] = '更新しました'
      redirect_to @post
    else
      render 'posts/edit'
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :content)
  end

  def target_post
    @post = Post.find(params[:id])
  end

end
