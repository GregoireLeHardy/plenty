class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :donation_id
      t.integer :cent

      t.timestamps
    end
  end
end
