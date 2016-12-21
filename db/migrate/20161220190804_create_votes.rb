class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :type
      t.integer :city_id
      t.integer :user_id

      t.timestamps
    end
  end
end
