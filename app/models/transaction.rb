class Transaction < ActiveRecord::Base
	attr_accessible :business_name, :amount, :item_list

	belongs_to :user

	validates :business_name, :presence => true
	validates :amount, :presence => true
	validates :user_id, :presence => true

	default_scope :order => 'transactions.created_at DESC'
end
