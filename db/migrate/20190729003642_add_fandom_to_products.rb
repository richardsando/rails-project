class AddFandomToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :fandom, foreign_key: true
  end
end
