class Vessel < ApplicationRecord
  belongs_to :marina

  def self.greater_than_length(number)
    where("length_overall > ?", number.to_i)
  end

  def self.mast_up
    where(mast_up: true)
  end

  def self.sorted
    order(:name)
  end

  def mast_text
    if self.mast_up
      "Mast up"
    else
      "Mast stored"
    end

  end
end
