class ChangeIdsToReferences < ActiveRecord::Migration[5.2]
  def change
    #articles
    remove_column :articles, :project_id, :integer
    add_reference :articles, :project, index: true


    #projects
    remove_column :projects, :user_id, :integer
    add_reference :projects, :user, index: true

    #project_categories
    remove_column :project_categories, :project_id, :integer
    remove_column :project_categories, :category_id, :integer
    add_reference :project_categories, :project, index: true
    add_reference :project_categories, :category, index: true

    #follower_projects
    remove_column :follower_projects, :project_id, :integer
    remove_column :follower_projects, :user_id, :integer
    add_reference :follower_projects, :project, index: true
    add_reference :follower_projects, :user, index: true

    #dontations
    remove_column :donations, :project_id, :integer
    remove_column :donations, :user_id, :integer
    add_reference :donations, :project, index: true
    add_reference :donations, :user, index: true

    #payments
    remove_column :payments, :donation_id, :integer
    add_reference :payments, :donation, index: true
  end
end
