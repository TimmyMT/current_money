class DropUselessColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :day
    remove_column :courses, :month
    remove_column :courses, :hour
    remove_column :courses, :minute
  end
end
