class CreateWineries < ActiveRecord::Migration[8.1]
  def change
    create_table :wineries do |t|
      t.string :name, null: false
      t.string :website
      t.string :address

      t.references :district, null: false, foreign_key: true

      t.timestamps
    end
  end
end
