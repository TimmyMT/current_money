class CourseControlService
  def initialize
    date_str = "#{DateTime.now.month}/#{DateTime.now.year}"
    @get_xml = Nokogiri::XML(open("http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1=
      #{DateTime.now.day - 1}/#{date_str}&date_req2=
      #{DateTime.now.day}/#{date_str}&VAL_NM_RQ=R01235").read)
    @current_course_value = @get_xml.children.children.children[1].children.to_s
  end

  def call
    Course.create(name: 'USD', value: @current_course_value)
  end
end
