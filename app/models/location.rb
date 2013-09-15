class Location < ActiveRecord::Base
  attr_accessible :name

  has_many :signs

  validates :name, {presence: true, uniqueness: true}
end
