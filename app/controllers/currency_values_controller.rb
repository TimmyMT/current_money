class CurrencyValuesController < ApplicationController
  def index
    @daily_cource = Course.order(created_at: :desc).first

    # date_str = "#{DateTime.now.month}/#{DateTime.now.year}"
    # @parse = Nokogiri::XML(open("http://www.cbr.ru/scripts/XML_dynamic.asp?date_req1=
    #   #{DateTime.now.day - 1}/#{date_str}&date_req2=
    #   #{DateTime.now.day}/#{date_str}&VAL_NM_RQ=R01235").read)
    # @current_course = @parse.children.children.children[1].children.to_s
  end
end
