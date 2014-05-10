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
end
