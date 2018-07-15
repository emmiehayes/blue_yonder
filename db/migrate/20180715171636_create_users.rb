class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email_address
      t.string :password_digest
      t.integer :high_pref, :default => 0
      t.integer :low_pref, :default => 0

      t.timestamps
    end
  end
end
