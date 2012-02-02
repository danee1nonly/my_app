class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :description
      t.references :owner

      t.timestamps
    end
    add_index :shops, :owner_id
  end
end
