class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.string :number, null: false
      t.text :description, null: false
      t.string :day_of_the_week, null: false
      t.string :time_of_day, null: false
      t.belongs_to :institution, foreign_key: true

      t.timestamps
    end
  end
end
