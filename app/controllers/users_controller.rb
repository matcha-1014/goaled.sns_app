class UsersController < ApplicationController
  before_action :forbit_guest_user, only: [:index, :show, :edit, :update, :logout]
  before_action :forbit_login_user, only: [:new, :create, :login, :login_form]
  
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
    if params[:id].to_i != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/users/#{@current_user.id}")
    end
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

  def login_form
    
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "メールアドレスかパスワードに不備があります"
      @input_email = params[:email]
      @input_password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    if session[:id]
      session[:id] = "nil"
      flash[:notice] = "ログアウトしました"
      redirect_to("/login")
    end
  end

end
