class AddBankAccountsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :bank1_name, :string
    add_column :users, :bank1_routing_number, :string
    add_column :users, :bank1_account_number, :string
    add_column :users, :bank1_isDefault, :boolean
    add_column :users, :bank2_name, :string
    add_column :users, :bank2_routing_number, :string
    add_column :users, :bank2_account_number, :string
    add_column :users, :bank2_isDefault, :boolean
  end

  def self.down
    remove_column :users, :bank1_name, :string
    remove_column :users, :bank1_routing_number, :string
    remove_column :users, :bank1_account_number, :string
    remove_column :users, :bank1_isDefault, :boolean
    remove_column :users, :bank2_name, :string
    remove_column :users, :bank2_routing_number, :string
    remove_column :users, :bank2_account_number, :string
    remove_column :users, :bank2_isDefault, :boolean
  end
end
