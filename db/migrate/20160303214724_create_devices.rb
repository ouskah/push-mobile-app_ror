class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :platform
      t.string :version
      t.string :uuid
      t.string :model
      t.string :token
      t.integer :app_id

      t.timestamps null: false
    end
  end
end
