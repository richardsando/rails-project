class CreateProductVariants < ActiveRecord::Migration[5.2]
  def change
    create_table :product_variants do |t|
      t.references :product, foreign_key: true
      t.references :size, foreign_key: true
      t.references :color, foreign_key: true
      t.integer :stock_QTY
      t.float :price

      t.timestamps
    end
  end
end
