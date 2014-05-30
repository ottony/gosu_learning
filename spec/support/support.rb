require 'spec_helper'

module Support
  class Window
    attr_reader :width, :height

    def initialize width: 900, height: 700
      @width = width
      @height = height
    end
  end
  
  def self.window *args
    return Window.new args.first if args.any?
    Window.new
  end
end
