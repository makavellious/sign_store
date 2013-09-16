class RemoveLocationsIdFromSigns < ActiveRecord::Migration
  def up
  	remove_column :signs, :locations_id
  end

  def down
  	add_column :signs, :locations_id, :integer
  end
end
