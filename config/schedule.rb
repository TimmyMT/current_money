# for commit changes need insert command:
# whenever --update-crontab
# whenever --update-crontab --set environment=production
# whenever --update-crontab --set environment=development

every 1.day, at: '06:00 am' do
  # runner "DailyCourseJob.perform_now"
  runner "CourseControlService.new.call"
end

every 1.day, at: '12:00 am' do
  runner "CourseControlService.new.call"
end

every 1.day, at: '18:00 am' do
  runner "CourseControlService.new.call"
end

every 1.day, at: '00:00 am' do
  runner "CourseControlService.new.call"
end
