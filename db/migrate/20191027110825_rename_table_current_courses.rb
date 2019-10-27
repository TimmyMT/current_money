class RenameTableCurrentCourses < ActiveRecord::Migration[5.2]
  def change
    rename_table :current_courses, :courses
  end
end
