# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :createlogin
  def createlogin
    if session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
    else
      @current_user = User.new
      @current_user.save
      session[:user_id] = @current_user.id
    end
  end
end
