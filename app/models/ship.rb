class Ship < ApplicationRecord
  belongs_to :board

  has_many :coordinates

  def is_alive?
    return false if coordinates.empty?

    coordinates.each do |coordinate|
      return true if coordinate.is_occupied?
    end

    false
  end
end
