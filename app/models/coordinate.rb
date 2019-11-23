class Coordinate < ApplicationRecord
  belongs_to :board
  belongs_to :ship, :optional => true

  validates :x_coordinate, :presence => true
  validates :y_coordinate, :presence => true
  validates :status,       :presence => true

  enum :status => ['unoccupied', 'occupied', 'hit']

  def is_occupied?
    return true if status == 'occupied'
  end

  def is_hit?
    return true if status == 'hit'
  end

  def is_unoccupied?
    return true if status == 'unoccupied'
  end
end
