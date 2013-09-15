class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.string :dir
      t.string :name
      t.string :mod
      t.string :mod_dir
      t.integer :quantity

      t.timestamps
    end
  end
end
