class AdminUser < ActiveRecord::Base
	
	# diciendole a rails que nuestra tabla !users, sino admin_users
	#set_table_name("admin_users")
	
	has_and_belongs_to_many :pages	
	has_many :section_edits
	#scope :named, lambda { |first,last| where (:first_name => first, :last_name => last)}
	
end
