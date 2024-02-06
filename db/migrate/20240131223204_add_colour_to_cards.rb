class AddColourToCards < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :colour, :integer, null: false, default: 0
  end
end
