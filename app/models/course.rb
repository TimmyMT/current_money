class Course < ApplicationRecord
  VALUE_FORMAT = /(^\d+(\,\d+)?$)/i

  validates :value, presence: true
  validates :value, format: { with: VALUE_FORMAT }

  after_commit :notify_course

  def notify_course
    ActionCable.server.broadcast(
      "courses",
      course: Course.last
    )
  end
end
