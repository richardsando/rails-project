class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :username
      t.text :about
      t.string :location
      t.date :joindate

      t.timestamps
    end
  end
end
