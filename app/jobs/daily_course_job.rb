class DailyCourseJob < ApplicationJob
  queue_as :default

  def perform
    CourseControlService.new.call
  end

end
