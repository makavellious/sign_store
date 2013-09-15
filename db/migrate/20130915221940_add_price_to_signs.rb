class AddPriceToSigns < ActiveRecord::Migration
  def change
    add_column :signs, :price, :integer
    add_column :signs, :locations_id, :integer
  end
end
