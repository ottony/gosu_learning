class Box
  attr_reader :height, :width
  attr_accessor :zoom

  def initialize window: , height: 64, width: 64, zoom: 1, x: 0, y: 0
    @height = height
    @width = width
    @zoom = zoom
    @window = window
    @x = x
    @y = y
  end

  def update time
  end

  def draw
  end

  def __x__
    @x - center(@width*@zoom) + center(@window.width)
  end

  def __y__
    @y - center(@height*@zoom) + center(@window.height)
  end

  def x
    @x
  end

  def y
    @y
  end

  private def center length
    length / 2
  end
end
