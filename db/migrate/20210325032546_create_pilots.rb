class CreatePilots < ActiveRecord::Migration[5.2]
  def change
    create_table :pilots do |t|
      t.string :name
      t.boolean :is_captain
      t.integer :years_experience
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
