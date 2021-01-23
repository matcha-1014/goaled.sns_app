class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      user_image: "user_default.jpg",
      password: params[:password]
    )

    if @user.save
      flash[:notice] = "正常にユーザー登録が完了しました"
      redirect_to("/users/index")
    else
      render("users/new")
    end
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
    @user.password = params[:password]

    user_image = params[:user_image]
    if user_image
      @user.user_image = "#{@user.id}.jpg"
      File.binwrite("public/images/#{@user.user_image}", user_image.read)
    end

    if @user.save
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

end
