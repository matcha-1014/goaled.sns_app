class PostsController < ApplicationController

  before_action :forbit_guest_user

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new()
  end

  def create
    @post = Post.new(content: params[:content])
    if @post.save
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
  end
end
