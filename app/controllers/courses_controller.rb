class CoursesController < ApplicationController
  def index
    if params[:type]
      course_type = CourseType.where("name = ?", params[:type]).first
      @courses = Course.where("course_type_id = ?", course_type)
    else
      @courses = Course.order("name ASC").all
    end
    @count = Course.all.count
    @json = @courses.to_gmaps4rails
  end
  
  def show
    @course = Course.find(params[:id])
    @gmaps_options = {
      "map_options" => {
        "auto_zoom" => false,
        "zoom" => 12,
        "center_latitude" => @course.latitude,
        "center_longitude" => @course.longitude,
        "container_class" => "gmaps4rails_map_single"
      },
      "markers" => {
        "data" => @course.to_gmaps4rails,
        "options" => {
          "picture" =>  "/assets/golfing.png",
          "width" => "32",
          "height" => "32"
        }
      }
    }
  end
  
  def all
    @course = Course.find(params[:course_id])
  end
end