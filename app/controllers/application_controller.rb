class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :createlogin
  def createlogin
    if User.find_by(id:session[:user_id])
      @current_user = User.find_by(id:session[:user_id])
    else
      @current_icon_id = rand(10)
      @current_icon_color_id = rand(10)
      @current_user = User.new(icon_id: @current_icon_id,icon_back_id: @current_icon_color_id)
      @current_user.save
      session[:user_id] = @current_user.id
    end
  end
end
