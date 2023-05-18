class AddComentToCreditsAndDeposits < ActiveRecord::Migration[7.0]
  def change
    add_column :deposits, :coment, :string
    add_column :credits, :coment, :string
  end
end
