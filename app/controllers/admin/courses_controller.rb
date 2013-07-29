class Admin::CoursesController < ApplicationController
  before_filter :authenticate_user!
  def index
    if current_user.role == 'admin'
      @courses = Course.all
    else
      redirect_to courses_path
    end
  end
  
  def new
    if current_user.role == 'admin'
      @course = Course.new
      @course_types = CourseType.all
      18.times do 
        @course.holes.build
      end
    else
      redirect_to courses_path
    end
  end
  
  def create
    @course = Course.new(params[:course])
    
    if @course.save
      redirect_to admin_courses_path, notice: "Course successfully created."
    else
      @course_types = CourseType.all
      render :new
    end
  end
  
  def edit
    if current_user.role == 'admin'    
      @course = Course.find(params[:id])
      @course_types = CourseType.all
    else
      redirect_to courses_path
    end
  end
  
  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      redirect_to admin_courses_path, notice: "Course successfully edited."
    else
      @course_types = CourseType.all
      render :edit
    end
  end
  
  def destroy
    
  end
end