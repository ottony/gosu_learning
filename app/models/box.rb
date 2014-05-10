class Box
  attr_reader :height, :width

  def initialize height: 64, width: 64
    @height = height
    @width = width
  end
end
