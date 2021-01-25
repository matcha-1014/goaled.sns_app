class ApplicationController < ActionController::Base
  before_action :get_current_user
  
  def get_current_user
    if session[:id]
      @current_user = User.find_by(id: session[:id])
    end
  end

  def forbit_guest_user
    if !(@current_user)
      flash[:notice] = "ログインしてください"
      redirect_to("/login")
    end
  end

  def forbit_login_user
    if @current_user
      flash[:notice] = "既にログインしています"
      redirect_to("/users/#{@current_user.id}")
    end
  end
end
