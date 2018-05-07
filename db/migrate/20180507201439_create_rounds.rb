class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.string :character
      t.integer :seconds
      t.string :status
      t.integer :score

      t.timestamps
    end
  end
end
