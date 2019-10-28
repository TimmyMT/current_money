module CoursesHelper
  def current_course
    Course.order(created_at: :desc).first
  end
end
