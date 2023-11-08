class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.references :column, null: false, foreign_key: true
      t.string :title, null: false
      t.integer :position, null: false
      t.timestamps
    end
  end
end
