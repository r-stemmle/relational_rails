class Airline < ApplicationRecord
  has_many :pilots

  validates_presence_of :name
end