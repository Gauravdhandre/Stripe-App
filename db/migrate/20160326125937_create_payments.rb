class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :price
      t.date :pay_date

      t.timestamps null: false
    end
  end
end
