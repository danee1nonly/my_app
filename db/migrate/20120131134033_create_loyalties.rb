class CreateLoyalties < ActiveRecord::Migration
  def change
    create_table :loyalties do |t|
      t.string :name
      t.integer :points
      t.references :shop
      t.references :profile
      
      t.timestamps
    end
    
    add_index :loyalties, :shop_id
    add_index :loyalties, :profile_id
  end
end
