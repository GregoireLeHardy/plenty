class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.integer :amount
      t.integer :project_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end

