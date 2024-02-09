class RemoveUserIdFromComments < ActiveRecord::Migration[7.1]
  def change
    remove_index :comments, :user_id
    remove_column :comments, :user_id, :integer
  end
end
