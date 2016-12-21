class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.integer :rank
      t.integer :upvote_count
      t.integer :downvote_count
      t.integer :vote_count
      t.integer :official_status, default: 0

      t.timestamps
    end
  end
end
