class Board < ApplicationRecord
  belongs_to :game

  has_many :coordinates
  has_many :ships

  def is_alive?
    return false if ships.empty?

    ships.each do |ship|
      return true if ship.is_alive?
    end

    false
  end

  def create_coordinates
    return unless coordinates.empty?

    (0..9).each do |x|
      (0..9).each do |y|
        Coordinate.create({
          x_coordinate: x,
          y_coordinate: y,
          board:        self,
        })
      end
    end
  end

  def auto_create_ships
    return unless coordinates

    ship_lengths = [2, 3, 3, 4, 5]

    ship_lengths.each do |ship_length|
      arr = []
      while arr.empty?
        arr = find_unoccupied_coordinates_of ship_length
      end

      ship = Ship.create(:board => self)
      arr.each do |coordinate|
        coordinate.ship   = ship
        coordinate.status = 'occupied'

        coordinate.save!
      end
    end
  end

  def find_unoccupied_coordinates_of(length)
    # ill assume 0 as horizontal and 1 as vertical
    arr               = []
    orientation       = rand.round
    random_x          = (rand*9).round
    random_y          = (rand*9).round
    random_coordinate = \
      coordinates.find_by(x_coordinate: random_x, y_coordinate: random_y)

    return [] if random_coordinate.nil? || random_coordinate.is_occupied?

    arr.push random_coordinate

    (1..(length-1)).each do |coord|
      if(orientation == 0)
        new_x_coordinate = random_x + coord
        return [] if new_x_coordinate > 9
        new_coordinate   = \
          coordinates.find_by(x_coordinate: new_x_coordinate, y_coordinate: random_y)
      else
        new_y_coordinate = random_y + coord
        return [] if new_y_coordinate > 9
        new_coordinate   = \
          coordinates.find_by(x_coordinate: random_x, y_coordinate: new_y_coordinate)
      end

      return [] if new_coordinate.nil? || new_coordinate.is_occupied?

      arr.push new_coordinate
    end

    arr
  end

end
