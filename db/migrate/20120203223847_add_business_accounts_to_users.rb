class AddBusinessAccountsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :business1_name, :string
    add_column :users, :business1_member_type, :string
    add_column :users, :business1_id, :string
    add_column :users, :business2_name, :string
    add_column :users, :business2_member_type, :string
    add_column :users, :business2_id, :string
    add_column :users, :business3_name, :string
    add_column :users, :business3_member_type, :string
    add_column :users, :business3_id, :string
    add_column :users, :business4_name, :string
    add_column :users, :business4_member_type, :string
    add_column :users, :business4_id, :string
  end

  def self.down
    remove_column :users, :business1_name, :string
    remove_column :users, :business1_member_type, :string
    remove_column :users, :business1_id, :string
    remove_column :users, :business2_name, :string
    remove_column :users, :business2_member_type, :string
    remove_column :users, :business2_id, :string
    remove_column :users, :business3_name, :string
    remove_column :users, :business3_member_type, :string
    remove_column :users, :business3_id, :string
    remove_column :users, :business4_name, :string
    remove_column :users, :business4_member_type, :string
    remove_column :users, :business4_id, :string
  end

end
