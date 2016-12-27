class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :location
      t.string :organization
      t.text :additional_info

      t.timestamps
    end
  end
end
