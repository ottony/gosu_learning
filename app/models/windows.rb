require 'gosu'
require 'pry'

class Windows < Gosu::Window
  include Gosu

  def initialize
    super(900, 700, false)
    self.caption = "Cicloide Curve"
    @msg = Gosu::Font.new(self, "Times New Roman", 20)
    @time = 0
  end

  def update
    @time += update_interval
  end

  def draw
    @msg.draw("Seconds: #{(@time / 1000)}", 10,680,0,1,1,Gosu::Color::BLUE)
  end
end
