require 'rails_helper'

RSpec.describe CourseControlService do
  subject { CourseControlService.new }

  it 'service #call' do
    courses_count_before = Course.count
    subject.call
    expect(Course.count).to be > courses_count_before
  end

  it 'if new course have another value than last course' do
    last_course = Course.create(value: "30")
    courses_count_before = Course.count
    subject.current_course_value = "35"
    subject.call
    expect(Course.count).to be > courses_count_before
    expect(last_course).to_not eq Course.last
  end

  it 'if new course like before' do
    last_course = Course.create(value: "30")
    courses_count_before = Course.count
    subject.current_course_value = "30"
    subject.call
    expect(Course.count).to_not be > courses_count_before
    expect(last_course).to eq Course.last
  end

  context "if last course forced" do
    it 'permission false' do
      last_course = Course.create(value: "30", day: DateTime.now.day.to_s,
                                  month: DateTime.now.month.to_s,
                                  hour: (DateTime.now.hour + 1.hour).to_s,
                                  minute: DateTime.now.minute.to_s,
                                  forced: true)
      courses_count_before = Course.count
      subject.call
      expect(Course.count).to_not be > courses_count_before
      expect(last_course).to eq Course.last
    end

    it 'permission true' do
      last_course = Course.create(value: "30", day: DateTime.now.day.to_s,
                                  month: DateTime.now.month.to_s,
                                  hour: DateTime.now.hour.to_s,
                                  minute: DateTime.now.minute.to_s,
                                  forced: true)
      courses_count_before = Course.count
      subject.call
      expect(Course.count).to be > courses_count_before
      expect(last_course).to_not eq Course.last
    end
  end

end
