class RemoveProfileFkFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :profile, index: true, foreign_key: true
  end
end
