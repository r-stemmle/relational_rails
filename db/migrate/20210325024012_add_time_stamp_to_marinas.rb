class AddTimeStampToMarinas < ActiveRecord::Migration[5.2]
  def change
    add_column :marinas, :created_at, :datetime
    add_column :marinas, :updated_at, :datetime
  end
end
