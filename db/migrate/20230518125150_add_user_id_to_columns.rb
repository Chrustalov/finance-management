class AddUserIdToColumns < ActiveRecord::Migration[7.0]
  def change
    add_reference :credits, :user, null: false, foreign_key: true
    add_reference :outlays, :user, null: false, foreign_key: true
    add_reference :deposits, :user, null: false, foreign_key: true

    
  end
end
