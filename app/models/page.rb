class Page < ActiveRecord::Base
	
	belongs_to :subject
	has_many :sections	
	has_and_belongs_to_many :editors, :class_name => "AdminUser"
	
	validates_presence_of :name
	validates_length_of_ :name, :maximum => 255
	validates_presence_of :permalink
	validates_length_of_ :permalink, :within => 3..255
	# se ocupa el within, para que el presence no sean solo espacios
	validates_uniqueness_of :permalink
	
end
