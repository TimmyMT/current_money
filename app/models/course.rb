class Course < ApplicationRecord
  validates :name, :value, presence: true

  after_create :notify_course

  def notify_course
    ActionCable.server.broadcast(
      "courses",
      course: Course.last
    )
  end
end
