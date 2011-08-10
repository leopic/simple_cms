class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
	  t.string "name"
	  t.string "permalink"
	  t.integer "position", :limit => 3
	  t.boolean "visible", :default => 1
	  t.string "content_type", :limit => 50
	  t.text "content"
      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
