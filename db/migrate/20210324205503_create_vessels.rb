class CreateVessels < ActiveRecord::Migration[5.2]
  def change
    create_table :vessels do |t|
      t.string :name
      t.string :make
      t.integer :length_overall
      t.boolean :mast_up

      t.timestamp
    end
  end
end
