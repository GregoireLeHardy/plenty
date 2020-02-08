class AddArticlesCountToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :articles_count, :integer, :default => 0
  end
end
