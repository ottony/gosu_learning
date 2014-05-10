require './app/models/box.rb'

class RandonBox < Box
  attr_reader :image

  def initialize(*args)
    args.any? ? super(args.first) : super
    generate_randon_image
  end

  def generate_randon_image
    randon_range = total_colors - 1
    @image = []
    @width.times do |w|
      @image << []
      @height.times do |h|
        @image[w] << colors[rand(randon_range)]
      end
    end
    @image
  end

  private
  def colors
    @colors ||= Gosu::Color.constants.pop(total_colors)
    @colors
  end

  def total_colors
    Gosu::Color.constants.count - 2
  end
end
