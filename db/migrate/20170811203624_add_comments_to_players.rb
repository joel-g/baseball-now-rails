class AddCommentsToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :comments, :string
  end
end
