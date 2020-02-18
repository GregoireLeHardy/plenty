class AddDefaultToProjects < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :published, :boolean, :default => false
  end
end
