class CreateCountries < ActiveRecord::Migration[8.1]
  def change
    create_table :countries do |t|
      t.string :name, null: false

      t.string :iso2, limit: 2
      t.string :iso3, limit: 3

      t.timestamps
    end
  end
end
