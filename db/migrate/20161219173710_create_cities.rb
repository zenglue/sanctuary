class CreateCities < ActiveRecord::Migration[5.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :state
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
