class AddDonerPriceToDonations < ActiveRecord::Migration[5.2]
  def change
    add_column :donations, :doner_price, :integer
  end
end
