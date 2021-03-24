class CreateAirlines < ActiveRecord::Migration[5.2]
  def change
    create_table :airlines do |t|
      t.string :name
      t.integer :fleet_size
      t.boolean :is_mainline_passenger
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
