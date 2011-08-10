class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
	  t.string "name"
	  t.string "permalink"
	  t.integer "position", :limit => 3
	  t.boolean "visible", :default => 1
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
