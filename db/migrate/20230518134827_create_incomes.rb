class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.integer :value
      t.string :coment
      #t.integer :user_id, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
