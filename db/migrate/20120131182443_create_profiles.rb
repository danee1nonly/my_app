class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :profiles, :user_id
  end
end
