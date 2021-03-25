class AddTimestamptoVessels < ActiveRecord::Migration[5.2]
  def change
    add_column :vessels, :created_at, :datetime
    
  end
end
