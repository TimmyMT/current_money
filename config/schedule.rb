# for commit changes need insert command:
# whenever --update-crontab
# whenever --update-crontab --set environment=production
# whenever --update-crontab --set environment=development

every 1.minute do
  # runner "DailyCourseJob.perform_now"
  runner "CourseControlService.new.call"
end
