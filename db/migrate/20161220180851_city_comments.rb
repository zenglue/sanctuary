class CityComments < ActiveRecord::Migration[5.0]
  def change
    create_table :city_comments do |t|
      t.integer :comment_id
      t.integer :city_id

      t.timestamps
    end
  end
end
