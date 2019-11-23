class Game < ApplicationRecord
  has_many :boards

  def is_game_over?
    #game isnt over if theres no board, it just hasn't started
    return false if boards.empty?

    boards.each do |board|
      return true if !board.is_alive?
    end

    false
  end

  def initialize_game
    return unless boards.empty?

    (0..1).each do |s|
      player = Board.create(:game => self)
      player.create_coordinates
      player.auto_create_ships
    end

    return boards.last
  end

  def select_move(coordinates)
    return if boards.empty?
    #ill just always assume the first board is the computer
    #and that a coordinate is a hash
    enemy_board = boards[0]

    coordinate = enemy_board.coordinates.find_by(
      :x_coordinate => coordinates[:x],
      :y_coordinate => coordinates[:y],
    )

    return if coordinate.nil?

     coordinate.update_attributes!(:status => 'hit')

     enemy_board.coordinates.where.not(:status => 'hit')
  end
end
