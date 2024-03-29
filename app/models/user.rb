require 'digest'
class User < ActiveRecord::Base
	attr_accessor :password
	attr_accessible :name, :email, :password, :password_confirmation, 
					:street_address, :city_address, :state_address, 
					:zip_code, :phone_number,
					:business1_name, :business1_member_type, :business1_id,
					:business2_name, :business2_member_type, :business2_id,
					:business3_name, :business3_member_type, :business3_id,
					:business4_name, :business4_member_type, :business4_id,
					:bank1_name, :bank1_routing_number, :bank1_account_number, :bank1_isDefault,
					:bank2_name, :bank2_routing_number, :bank2_account_number, :bank2_isDefault

	has_many :microposts, :dependent => :destroy
	has_many :transactions, :dependent => :destroy

    # removed so new users who register can create accounts with only email addresses
	# validates :name, :presence => true, 
	#				 :length => { :maximum => 50 }
	validates :email, :presence => true, 
					  :uniqueness => { :case_sensitive => false }
	validates :password, :presence => true,
						 :confirmation => true,
						 :length => { :within => 6..40 }				  

	
	before_save :encrypt_password

	# Return true if the user's password matches the submitted password
	def has_password?(submitted_password)
		# compare encrypted_word with encrypted version of
		# submitted_password
		encrypted_password == encrypt(submitted_password)
	end

	# method to check to see if submitted email/password is
	# in the database.
	# returns nil if there is no such user
	# returns user if email/password matches user in db
	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

	def self.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
	end

	def feed
		# this is preliminary.
		Micropost.where("user_id = ?", id)
	end

	private
		def encrypt_password
			self.salt = make_salt unless has_password?(password)
			self.encrypted_password = encrypt(password)
		end

		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end

		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end

		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end

end
