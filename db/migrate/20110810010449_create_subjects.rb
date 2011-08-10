class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
	  t.string "name"
	  t.integer "position", :limit => 3
	  t.boolean "visible", :default => 1
      t.timestamps
    end
  end

  def self.down
    drop_table :subjects
  end
end
