class AddProjectidToStories < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :project_id, :integer
  end
end
