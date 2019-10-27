class CoursesChannel < ApplicationCable::Channel
  def follow
    stream_from "courses"
  end
end
