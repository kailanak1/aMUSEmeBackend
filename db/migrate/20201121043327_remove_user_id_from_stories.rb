class RemoveUserIdFromStories < ActiveRecord::Migration[6.0]
  def change
    remove_column :stories, :user_id, :integer
  end
end
