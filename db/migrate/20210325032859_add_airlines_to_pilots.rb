class AddAirlinesToPilots < ActiveRecord::Migration[5.2]
  def change
    add_reference :pilots, :airline, foreign_key: true
  end
end
