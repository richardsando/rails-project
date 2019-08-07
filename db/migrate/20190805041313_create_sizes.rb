class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string :category
      t.string :sizing

      t.timestamps
    end
  end
end
