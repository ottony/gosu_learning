require 'spec_helper'

describe Box do
  context 'whe drawing' do
    it 'convert cartesian to real position' do
      box = Box.new window: Support.window, x: 0, y: 0

      expect( box.__x__ ).to eq(450 - box.width / 2)
      expect( box.x ).to eq(0)
      expect( box.__y__ ).to eq(350 - box.height / 2)
      expect( box.y ).to eq(0)
    end

    it 'consider zoom in coversion' do
      box = Box.new window: Support.window, x: 0, y: 0, zoom: 5

      expect( box.__x__ ).to eq(450 - box.width*5 / 2)
      expect( box.__y__ ).to eq(350 - box.height*5 / 2)
    end
  end
end
