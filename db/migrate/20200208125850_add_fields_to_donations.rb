class AddFieldsToDonations < ActiveRecord::Migration[5.2]
  def change
    remove_column :donations, :amount, :integer
    remove_column :donations, :status, :string
    add_column :donations, :state, :string
    add_column :donations, :checkout_session_id, :string
  end
end

