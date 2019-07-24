class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :price
      t.string :size
      t.integer :stock
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
