class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  def index
    if current_user.role == 'admin'
      @users = User.all
    else
      redirect_to courses_path
    end
  end
  
  def show
    if current_user.role == 'admin'    
      @user = User.find(params[:id])
    else
      redirect_to courses_path
    end
  end
  
  def new
    if current_user.role == 'admin'    
      @user = User.new
    else 
      redirect_to courses_path
    end
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to admin_users_path, notice: "User successfully created."
    else
      render :new
    end
  end
  
  def edit
    if current_user.role == 'admin'
      @user = User.find(params[:id])
    else
      redirect_to courses_path
    end
  end
  
  def update
    
  end
  
  def destroy
    
  end
end