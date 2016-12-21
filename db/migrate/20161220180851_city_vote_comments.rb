class CityVoteComments < ActiveRecord::Migration[5.0]
  def change
    create_table :city_vote_comments do |t|
      t.belongs_to :comment
      t.belongs_to :vote

      t.timestamps
    end
  end
end
