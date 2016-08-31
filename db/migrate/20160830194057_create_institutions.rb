class CreateInstitutions < ActiveRecord::Migration[5.0]
  def change
    create_table :institutions do |t|
      t.string :name, null: false
      t.string :discipline, null: false
      t.string :founded, null: false
      t.boolean :accepting_applications, default: true

      t.timestamps
    end
  end
end
