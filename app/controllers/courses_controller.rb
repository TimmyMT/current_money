class CoursesController < ApplicationController
  def index
    # @daily_course = Course.order(created_at: :desc).first
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.forced = true
    @course.save
  end

  private

  def course_params
    params.require(:course).permit(:value, :day, :month, :hour, :minute, :forced)
  end
end
