class Outing < ApplicationRecord
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings

  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :date
end
