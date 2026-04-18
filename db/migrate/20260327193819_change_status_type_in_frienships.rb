class ChangeStatusTypeInFrienships < ActiveRecord::Migration[7.1]
  def change
    change_column :friendships, :status, 'integer USING CAST(status AS integer)'
  end
end
