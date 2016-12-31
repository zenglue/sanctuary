class AddVoteBalanceToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :vote_balance, :integer
  end
end
