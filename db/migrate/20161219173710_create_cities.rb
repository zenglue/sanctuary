class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.integer :rank
      t.integer :upvote_count, default: 0
      t.integer :downvote_count, default: 0
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
