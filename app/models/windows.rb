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
    @randon_box = RandonBox.new window: self
    @time = 0
    @count = 0
  end

  def update
    @randon_box.update

    @time += update_interval
    if ((@time - update_interval).ceil % 1000) == 0
      @fps = @count
      @count = 0
    end
    @count += 1

  end

  def controller comb
  end

  def draw
    @randon_box.draw
    draw_messages
  end

  private def draw_messages
    @msg.draw("X: #{@randon_box.__x__}", 10,640,0,1,1,Gosu::Color::BLUE)
    @msg.draw("Y: #{@randon_box.__y__}", 10,660,0,1,1,Gosu::Color::BLUE)
    @msg.draw("FPS: #{@fps}", 780,680,0,1,1,Gosu::Color::BLUE)
    @msg.draw("Seconds: #{(@time / 1000)}", 10,680,0,1,1,Gosu::Color::BLUE)
  end
end
