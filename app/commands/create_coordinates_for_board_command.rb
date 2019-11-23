module CreateCoordinatesForBoardCommand
  extend self

  def execute(board)
    return unless board.coordinates.empty?

    create_coordinates_for board
  end

  private

  def create_coordinates_for(board)
    return unless board.coordinates.empty?

    (0..9).each do |x|
      (0..9).each do |y|
        Coordinate.create({
          x_coordinate: x,
          y_coordinate: x,
          board:        board,
        })
      end
    end
  end
end
