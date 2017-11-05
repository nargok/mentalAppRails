class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
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

  private

  def posts_params
    params.require(:post).permit(:title, :content)
  end

end
