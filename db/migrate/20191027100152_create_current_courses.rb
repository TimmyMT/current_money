class CreateCurrentCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :current_courses do |t|
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
