class AddGameTable < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
    end

    add_reference :boards, :game, :foreign_key => true
  end
end
