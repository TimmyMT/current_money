class ChangeTableCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :name
    add_column :courses, :day, :string
    add_column :courses, :month, :string
    add_column :courses, :hour, :string
    add_column :courses, :minute, :string
    add_column :courses, :forced, :boolean, default: false
  end
end
