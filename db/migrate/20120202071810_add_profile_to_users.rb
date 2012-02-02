class AddProfileToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :street_address, :string
    add_column :users, :city_address, :string
    add_column :users, :state_address, :string
    add_column :users, :zip_code, :string
    add_column :users, :phone_number, :string
  end

  def self.down
  	remove_column :users, :street_address, :string
    remove_column :users, :city_address, :string
    remove_column :users, :state_address, :string
    remove_column :users, :zip_code, :string
    remove_column :users, :phone_number, :string
  end

end
