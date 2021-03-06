class Windows < Gosu::Window
  include Gosu
  attr_reader :time
  ZOOM = 1

  def initialize
    super(900, 700, false)
    self.caption = "Cicloide Curve"
    load
  end

  private def load
    @msg = Gosu::Font.new(self, "Times New Roman", 20)
    @randon_box = RandonBox.new window: self, zoom: 3, width: 32
    @time = 0
  end

  def update
    @randon_box.update

    @time += update_interval
  end

  def controller comb
  end

  def draw
    draw_quad(0, 0, Color::GRAY,
              900, 0, Color::RED,
              0, 700, Color::YELLOW,
              900, 700, Color::CYAN)
    @randon_box.draw
    draw_messages
  end

  private def draw_messages
    @msg.draw("X: #{@randon_box.x}", 10,640,0,1,1,Gosu::Color::BLUE)
    @msg.draw("Y: #{@randon_box.y}", 10,660,0,1,1,Gosu::Color::BLUE)
    @msg.draw("FPS: #{fps}", 780,680,0,1,1,Gosu::Color::BLUE)
    @msg.draw("Seconds: #{ milliseconds / 1000 }", 10,680,0,1,1,Gosu::Color::BLUE)
  end
end
