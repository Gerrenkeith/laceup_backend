class CreateAccesses < ActiveRecord::Migration[7.1]
  def change
    create_table :accesses do |t|
      t.integer :user_id
      t.integer :accessable_id
      t.string :accessable_type
      t.integer :access_level
      t.timestamps
    end
  end
end
