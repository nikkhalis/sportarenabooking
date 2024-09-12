class CreateCourts < ActiveRecord::Migration[7.2]
  def change
    create_table :courts do |t|
      t.string :name
      t.datetime :available
      t.integer :court_type
      t.references :arena, null: false, foreign_key: true

      t.timestamps
    end
  end
end
