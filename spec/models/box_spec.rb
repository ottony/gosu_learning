require 'spec_helper'

describe Box do
  context 'whe drawing' do
    it 'convert cartesian to real position' do
      box = Box.new x: 0, y: 0
      max_width = 900
      max_heigth = 700

      expect( box.__x__( max_width  )).to eq(450 - box.width / 2)
      expect( box.__y__( max_heigth )).to eq(350 - box.height / 2)
    end

    it 'consider zoom in coversion' do
      box = Box.new x: 0, y: 0, zoom: 5
      max_width = 900
      max_heigth = 700

      expect( box.__x__( max_width  )).to eq(450 - box.width*5 / 2)
      expect( box.__y__( max_heigth )).to eq(350 - box.height*5 / 2)
    end
  end
end
