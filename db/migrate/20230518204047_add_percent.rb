class AddPercent < ActiveRecord::Migration[7.0]
  def change
    add_column :deposits, :percent, :integer
    add_column :credits, :percent, :integer
  end
end
