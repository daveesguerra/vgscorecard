class ScorecardsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @scorecard = Scorecard.find(params[:id])
  end
  
  def new
    @scorecard = Scorecard.new
    @users = User.where("role = ?", "golfer")
    @course = Course.find(params[:course])
    
    holes = @course.holes.count
    
    4.times do 
      user_score = @scorecard.user_scores.build
      holes.times do 
        user_score.scores.build
      end
    end  
  end
  
  def create
    @scorecard = Scorecard.new(params[:scorecard])
    @course = Course.find(@scorecard.course_id)
    
    if @scorecard.save
      redirect_to course_path(@course), notice: "Course successfully created."
    else
      @users = User.all
      render :new
    end    
  end
  
  def edit
    @scorecard = Scorecard.where("id = ?", params[:id]).first
    @users = User.where("role = ?", "golfer")
    @course = @scorecard.course   
  end
  
  def update
    @scorecard = Scorecard.where("id = ?", params[:id]).first
    @course = Course.find(@scorecard.course_id)
    
    if @scorecard.update_attributes(params[:scorecard])
      redirect_to scorecard_path(@scorecard), notice: "Scorecard succcessfully updated."
    else
      @users = User.all
      render :edit
    end
  end
end