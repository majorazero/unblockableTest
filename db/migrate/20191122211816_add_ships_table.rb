class AddShipsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :ships do |t|
    end

    add_reference :coordinates, :ship, :foreign_key => true
  end
end
