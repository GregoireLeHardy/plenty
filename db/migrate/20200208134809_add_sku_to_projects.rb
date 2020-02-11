class AddSkuToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :sku, :string
  end
end
