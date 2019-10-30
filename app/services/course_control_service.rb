class CourseControlService
  attr_accessor :current_course_value

  def initialize
    date_str = "#{DateTime.now.month}/#{DateTime.now.year}"
    get_xml = Nokogiri::XML(open("http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1=
      #{DateTime.now.day - 1}/#{date_str}&date_req2=
      #{DateTime.now.day}/#{date_str}&VAL_NM_RQ=R01235").read)

    if get_xml.children.children.empty?
      get_xml = Nokogiri::XML(open("http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1=
      #{DateTime.now.day - 2}/#{date_str}&date_req2=
      #{DateTime.now.day - 1}/#{date_str}&VAL_NM_RQ=R01235").read)
    end

    @current_course_value = get_xml.children.children.children.last.children.to_s
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

    ready_time = last_course.expect_date.to_s < Time.now.to_s

    return ready_time
  end
end
