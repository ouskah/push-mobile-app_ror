class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.integer :devices_count
      t.string :image
      t.string :certificat_ios
      t.string :token
      t.integer :user_id

      t.timestamps null: false
    end
      
      add_index :apps, :user_id
      
      
      
  end
end
