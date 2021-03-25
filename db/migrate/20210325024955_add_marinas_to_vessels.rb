class AddMarinasToVessels < ActiveRecord::Migration[5.2]
  def change
    add_reference :vessels, :marina, foreign_key: true
  end
end
