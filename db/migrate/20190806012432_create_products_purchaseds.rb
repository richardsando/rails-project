class CreateProductsPurchaseds < ActiveRecord::Migration[5.2]
  def change
    create_table :products_purchaseds do |t|
      t.references :cart, foreign_key: true
      t.references :product_variant, foreign_key: true
      t.integer :purchase_QTY

      t.timestamps
    end
  end
end
