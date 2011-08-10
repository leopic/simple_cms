class AlterSubjectsPagesSections < ActiveRecord::Migration
  def self.up  	
  	puts "cambiando el default a invisible"
  	change_column("sections", "visible", :boolean, :default => false)
  	change_column("pages", "visible", :boolean, :default => false)
  	change_column("subjects", "visible", :boolean, :default => false)
  	
  	puts "agregando la llave foranea"
  	add_column("pages", "subject_id", :integer)
  	add_column("sections", "page_id", :integer)
  	
  	puts "agregando indices"
  	add_index("pages","subject_id")
  	add_index("pages","permalink")
  	add_index("sections","page_id")
  end

  def self.down
  	puts "removiendo indices"
  	remove_index("pages","permalink")
  	#remove_index("sections","page_id")  	
  	#remove_index("pages","subject_id")
  	
  	puts "removiendo llaves foraneas"
  	remove_column("sections", "page_id")
  	remove_column("pages", "subject_id")
  	
  	puts "cambiando el default a visible"
  	change_column("sections", "visible", :boolean, :default => true)
  	change_column("pages", "visible", :boolean, :default => true)
  	change_column("subjects", "visible", :boolean, :default => true)  	
  	  	
  end
end
