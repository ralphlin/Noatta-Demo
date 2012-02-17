class Transaction < ActiveRecord::Base
	attr_accessible :business_name, :amount, :item_list

	belongs_to :user

	default_scope :order => 'transactions.created_at DESC'
end
