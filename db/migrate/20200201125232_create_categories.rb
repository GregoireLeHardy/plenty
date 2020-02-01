class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.text :short_description
      t.string :name

      t.timestamps
    end
  end
end
