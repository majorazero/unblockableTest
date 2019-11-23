class CoordinateSerializer < ActiveModel::Serializer
  attributes \
    :x,
    :y,
    :status

  def x
    object.x_coordinate
  end

  def y
    object.x_coordinate
  end

  def status
    case object.status
    when 'hit'
      'x'
    else
      'o'
    end
  end
end
