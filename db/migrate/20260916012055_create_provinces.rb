class CreateProvinces < ActiveRecord::Migration[8.1]
  def change
    create_table :provinces do |t|
      t.string :name, null: false

      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
