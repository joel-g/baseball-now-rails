class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name,
      t.string :location
      t.integer :pitches_faced
      t.integer :hits
      t.integer :innings
      t.date :date
      t.timestamps
    end
  end
end
