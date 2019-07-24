class CreateWishlists < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlists do |t|
      t.references :profile, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
