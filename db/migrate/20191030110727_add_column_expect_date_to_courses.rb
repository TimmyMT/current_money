class AddColumnExpectDateToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :expect_date, :datetime, default: nil
  end
end
