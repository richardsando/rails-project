class DropCartProductsJoinTable < ActiveRecord::Migration[5.2]
  def change
    # drop_join_table :carts, :products, table_name: cart_products
    drop_table: cart_products
  end
end
