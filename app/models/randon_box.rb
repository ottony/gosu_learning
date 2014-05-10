require './app/models/box.rb'

class RandonBox < Box
  attr_reader :image

  def initialize(*args)
    args.any? ? super(args.first) : super
    @image = generate_randon_image
  end

  def draw window
    @image.each_with_index do |line, line_index|
      line.each_with_index do |col, col_index|
        tile = tile(line_index, col_index)

        window.draw_quad(tile[:A][:x], tile[:A][:y], Gosu::Color.const_get(col),
                         tile[:B][:x], tile[:B][:y], Gosu::Color.const_get(col),
                         tile[:C][:x], tile[:C][:y], Gosu::Color.const_get(col),
                         tile[:D][:x], tile[:D][:y], Gosu::Color.const_get(col))

      end
    end
  end

  def tile line_index, col_index
    line_position = line_index * @zoom
    col_position = col_index * @zoom

    {
      A: { x: @x + col_position           , y: @y + line_position           },
      B: { x: @x + col_position + @zoom   , y: @y + line_position           },
      C: { x: @x + col_position           , y: @y + line_position + @zoom   },
      D: { x: @x + col_position + @zoom   , y: @y + line_position + @zoom   },
    }
  end


  private

  def generate_randon_image
    randon_range = total_colors - 1

    (1..@width).map do
      (1..@height).map do
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
