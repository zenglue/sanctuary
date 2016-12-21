class CityVoteComments < ActiveRecord::Migration[5.0]
  def change
    create_table :city_vote_comments do |t|
      t.integer :comment_id
      t.integer :vote_id

      t.timestamps
    end
  end
end
