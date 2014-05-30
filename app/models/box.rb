class Box
  attr_reader :height, :width
  attr_reader :x, :y
  attr_accessor :zoom

  def initialize height: 64, width: 64, zoom: 1, x: 0, y: 0
    @height = height
    @width = width
    @zoom = zoom
    @x = x
    @y = y
  end

  def update time
  end

  def draw window
  end

  def __x__ max_width = 900
    @x - center(@width*@zoom) + center(max_width)
  end

  def __y__ max_heigth = 700
    @y - center(@height*@zoom) + center(max_heigth)
  end

  private def center length
    length / 2
  end
end
