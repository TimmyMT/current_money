class Course < ApplicationRecord
  # NUMBER_FORMAT = /[0-9]{2}\z/i

  validates :value, presence: true

  # after_create :notify_course
  after_commit :notify_course

  def notify_course
    ActionCable.server.broadcast(
      "courses",
      course: Course.last
    )
  end
end
