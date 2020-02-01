class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.integer :project_id
      t.integer :popularity_article

      t.timestamps
    end
  end
end
