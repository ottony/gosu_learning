require './app/models/box.rb'

class RandonBox < Box
  attr_reader :image

  def initialize(*args)
    args.any? ? super(args.first) : super
    @image = generate_randon_image
  end

  def update
    time = @window.time / 1000

    @x = center(@window.width) * (Math.sin(time / 10 * Math::PI))
    @y = center(@window.height) * (Math.cos(time / 10 * Math::PI))
  end

  def draw
    each_pixel do |color, line_index, col_index|
        tile = tile(line: line_index, column: col_index, x: __x__, y: __y__)
        draw_tile(tile, color)
    end
  end

  def each_pixel &block
    @image.each_with_index do |line, line_index|
      line.each_with_index do |col, col_index|
        yield(col, line_index, col_index) if block_given?
        col
      end
    end
  end

  def draw_tile tile, color
    @window.draw_quad(tile[:A][:x], tile[:A][:y], Gosu::Color.const_get(color),
                      tile[:B][:x], tile[:B][:y], Gosu::Color.const_get(color),
                      tile[:C][:x], tile[:C][:y], Gosu::Color.const_get(color),
                      tile[:D][:x], tile[:D][:y], Gosu::Color.const_get(color))
  end

  def tile(line:, column:, x: __x__, y: __y__, zoom: @zoom)
    y_position = line * zoom
    x_position = column * zoom

    {
      A: { x: x + x_position           , y: y + y_position            },
      B: { x: x + x_position + zoom    , y: y + y_position            },
      C: { x: x + x_position           , y: y + y_position   + zoom   },
      D: { x: x + x_position + zoom    , y: y + y_position   + zoom   },
    }
  end

  private

  def generate_randon_image
    randon_range = total_colors - 1

    (1..@height).map do
      (1..@width).map do
        colors[rand(randon_range)]
      end
    end
  end

  def colors
    @colors ||= Gosu::Color.constants.pop(total_colors)
    @colors
  end

  def total_colors
    Gosu::Color.constants.count - 2
  end
end
