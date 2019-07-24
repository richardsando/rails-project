class AddActiveStatusToCart < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :active_status, :boolean
  end
end
