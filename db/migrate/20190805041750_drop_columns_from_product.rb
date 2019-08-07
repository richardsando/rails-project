class DropColumnsFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :price
    remove_column :products, :size
    remove_column :products, :stock
  end
end
