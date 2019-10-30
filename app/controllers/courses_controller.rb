class CoursesController < ApplicationController
  before_action :admin_permission?, only: [:new, :create]

  def index
    @courses = Course.where("created_at >= ?", DateTime.now - 1.day).order(created_at: :desc).limit(10)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.forced = true
    @course.save!
  end

  private

  def admin_permission?
    redirect_to root_path, alert: 'Not enough pernissions!' unless current_user&.admin?
  end

  def course_params
    params.require(:course).permit(:value, :day, :month, :hour, :minute, :forced)
  end
end
