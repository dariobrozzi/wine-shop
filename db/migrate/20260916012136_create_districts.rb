class CreateDistricts < ActiveRecord::Migration[8.1]
  def change
    create_table :districts do |t|
      t.string :name, null: false

      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
