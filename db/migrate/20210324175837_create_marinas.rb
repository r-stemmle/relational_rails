class CreateMarinas < ActiveRecord::Migration[5.2]
  def change
    create_table :marinas do |t|
      t.string :name
      t.string :city
      t.string :state
      t.boolean :has_boat_ramp
      t.integer :low_tide_depth
      t.integer :high_tide_depth
    end
  end
end
