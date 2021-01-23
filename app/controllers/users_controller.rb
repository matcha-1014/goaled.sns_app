class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new()
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.user_image = params[:user_image]
    @user.password = params[:password]
    if @user.save
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users#edit")
    end
  end

  def create
    @user = User.new(name: params[:name], email: params[:name])
    if @user.save
      redirect_to("/users/index")
    else
      render("users/new")
    end
  end
end
