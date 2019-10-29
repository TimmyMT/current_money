class CourseControlService
  def initialize
    date_str = "#{DateTime.now.month}/#{DateTime.now.year}"
    @get_xml = Nokogiri::XML(open("http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1=
      #{DateTime.now.day - 1}/#{date_str}&date_req2=
      #{DateTime.now.day}/#{date_str}&VAL_NM_RQ=R01235").read)

    if @get_xml.children.children.empty?
      @get_xml = Nokogiri::XML(open("http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1=
      #{DateTime.now.day - 2}/#{date_str}&date_req2=
      #{DateTime.now.day - 1}/#{date_str}&VAL_NM_RQ=R01235").read)
    end

    @current_course_value = @get_xml.children.children.children.last.children.to_s
  end

  def call
    @new_course = Course.new(value: @current_course_value)

    return @new_course.save! if Course.last.nil?

    if permission
      @new_course.save! if @new_course.value != Course.last.value
    end
  end

  def permission
    last_course = Course.last
    return true unless last_course.forced?

    expect_time = "#{last_course.day}/#{last_course.month}/#{DateTime.now.year} #{last_course.hour}:#{last_course.minute}"
    time_now = "#{DateTime.now.day}/#{DateTime.now.month}/#{DateTime.now.year} #{DateTime.now.hour}:#{DateTime.now.minute}"
    ready_time = time_now >= expect_time

    forced_last_course = last_course.forced?

    return forced_last_course && ready_time
  end
end
