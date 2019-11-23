class AddBoardTable < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
    end

    add_reference :coordinates, :board, :foreign_key => true
    add_reference :ships, :board, :foreign_key => true
  end
end
