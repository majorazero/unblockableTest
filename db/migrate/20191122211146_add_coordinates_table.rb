class AddCoordinatesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :coordinates do |t|
      t.integer :x_coordinate, :null => false
      t.integer :y_coordinate, :null => false
      t.integer :status, :default => 0, :null => false
    end
  end
end
