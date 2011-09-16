class Section < ActiveRecord::Base
	
	belongs_to :page
	has_many :section_edits
	
	validates_presence_of :name
	
end
