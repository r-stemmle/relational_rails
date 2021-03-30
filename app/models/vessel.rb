class Vessel < ApplicationRecord
  belongs_to :marina

  def mast_text
    if self.mast_up
      "Mast up"
    else
      "Mast stored"
    end

  end
end
