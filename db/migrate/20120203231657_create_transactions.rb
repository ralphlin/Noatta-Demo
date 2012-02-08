class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.string :business_name
      t.decimal :amount
      t.string :item_list
      t.integer :user_id

      t.timestamps
    end
    add_index :transactions, [:user_id, :created_at]
  end

  def self.down
  	drop_table :transactions
  end
end
