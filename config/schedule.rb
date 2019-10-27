every 12.hours do
  runner "DailyCourseJob.perform_now"
end
