class CreateCredits < ActiveRecord::Migration[7.0]
  def change
    create_table :credits do |t|
      t.integer :value

      t.timestamps
    end
  end
end
