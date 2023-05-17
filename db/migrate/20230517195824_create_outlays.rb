class CreateOutlays < ActiveRecord::Migration[7.0]
  def change
    create_table :outlays do |t|
      t.integer :value
      t.string :coment

      t.timestamps
    end
  end
end
