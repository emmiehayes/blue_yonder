class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :nick_name
      t.string :state
      t.integer :high_temp
      t.integer :low_temp

      t.timestamps
    end
  end
end
