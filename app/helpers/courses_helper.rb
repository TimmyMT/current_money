module CoursesHelper
  def current_course
    Course.order(created_at: :desc).first
  end

  def courses_before
    limit = 0
    courses = []
    Course.where(forced: true).order(created_at: :desc).each do |course|
      limit += 1
      courses << course
      break if limit == 5
    end
    return courses
  end

  def last_forced_course
    Course.where(forced: true).order(created_at: :desc).first
  end
end
