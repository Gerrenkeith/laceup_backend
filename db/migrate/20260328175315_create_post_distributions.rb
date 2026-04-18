class CreatePostDistributions < ActiveRecord::Migration[7.1]
  def change
    create_table :post_distributions do |t|
      t.integer :post_id
      t.integer :target_id
      t.string :target_type
      t.timestamps
    end
  end
end
