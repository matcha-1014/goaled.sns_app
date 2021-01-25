class HomeController < ApplicationController
  before_action :forbit_login_user

  def top
  end
end
