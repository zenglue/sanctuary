class AddIndexToCityVoteComments < ActiveRecord::Migration[5.0]
  def change
    add_index :city_vote_comments, [:comment_id, :vote_id]
  end
end
