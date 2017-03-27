class ChangeTopicColumns < ActiveRecord::Migration[5.0]
  def change
    change_column :topics, :title, :string, null: false
    add_index :topics, :title, unique: true
    change_column :topics, :votes, :integer, null: false
    add_index :topics, :votes
  end
end
