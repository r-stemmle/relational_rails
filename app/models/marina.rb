class Marina < ApplicationRecord
  has_many :vessels, dependent: :destroy

  def self.descending_order_by_created
    order(created_at: :desc)
  end
end
