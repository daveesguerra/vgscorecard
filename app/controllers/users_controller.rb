class UsersController < ApplicationController
  def index
    @users = User.where("role <> ?", "admin")
  end
  
  def show
    @user = User.where("name = ?", params[:id]).first
  end
end