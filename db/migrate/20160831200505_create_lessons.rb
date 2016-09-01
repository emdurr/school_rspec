class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :name, null: false
      t.string :subject
      t.string :content
      t.belongs_to :course, foreign_key: true

      t.timestamps
    end
  end
end
