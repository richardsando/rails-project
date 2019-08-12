class AddTotalToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :total, :float
  end
end
