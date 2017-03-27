class AddDefaultValueToVotes < ActiveRecord::Migration[5.0]
  def change
    change_column :topics, :votes, :integer, default: 0
  end
end
