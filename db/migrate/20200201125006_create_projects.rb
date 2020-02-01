class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.text :short_description
      t.text :long_description
      t.integer :popularity_project
      t.boolean :published

      t.timestamps
    end
  end
end
