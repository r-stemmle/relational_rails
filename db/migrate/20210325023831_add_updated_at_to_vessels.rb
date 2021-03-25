class AddUpdatedAtToVessels < ActiveRecord::Migration[5.2]
  def change
    add_column :vessels, :updated_at, :datetime
  end
end
