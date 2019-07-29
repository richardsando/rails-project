class CreateFandoms < ActiveRecord::Migration[5.2]
  def change
    create_table :fandoms do |t|
      t.string :fandom

      t.timestamps
    end
  end
end
