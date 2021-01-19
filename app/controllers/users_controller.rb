class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(name: params[:name], email: params[:name])
    if @user.save
      redirect_to('/users/index')
    else
      render('users/new')
    end
  end
end
