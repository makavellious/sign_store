class Sign < ActiveRecord::Base
  attr_accessible :dir, :mod, :mod_dir, :name, :quantity

  belongs_to :location

  validates :name, :mod, presence: true
end
