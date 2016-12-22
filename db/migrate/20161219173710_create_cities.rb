class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.integer :vote_count
      t.integer :official_status
      t.integer :unofficial_status

      t.timestamps
    end
  end
end
