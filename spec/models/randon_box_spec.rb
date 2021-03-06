require 'spec_helper'

describe RandonBox do

  context 'generate randon image' do
    let(:randon_box) { RandonBox.new(window: Support.window, width: 64, height: 64) }
    let(:colors) { [:NONE, :BLACK, :GRAY, :WHITE, :AQUA, :RED, :GREEN, :BLUE, :YELLOW, :FUCHSIA, :CYAN] }

    it 'with right quad dimentions' do
      expect(randon_box.image.count).to be(64)
      expect(randon_box.image.sample.count).to be(64)
    end

    it 'with right rectangle dimentions' do
      randon_box = RandonBox.new(window: Support.window, width: 32, height: 64)
      expect(randon_box.image.count).to be(64)
      expect(randon_box.image.sample.count).to be(32)
    end

    it 'with colors' do
      color = randon_box.image.sample.sample
      expect(colors.include? color).to be_true
    end
  end

  context 'mount tile to draw' do
    let(:line_index) { 1 }
    let(:col_index) { 1 }
    let(:randon_box) { RandonBox.new(window: Support.window, height: 64, width: 64, x: 1 , y: 1, zoom: 1) }

    before(:each) do 
      randon_box.stub(:__x__) { randon_box.x }
      randon_box.stub(:__y__) { randon_box.y }
    end

    it 'without zoom' do
      tile = randon_box.tile(line: line_index, column: col_index)
      expected_tile = {
        A: { x: 2 , y: 2 },
        B: { x: 3 , y: 2 },
        C: { x: 2 , y: 3 },
        D: { x: 3 , y: 3 },
      }
      expect(tile).to eq(expected_tile)
    end

    it 'with zoom' do
      randon_box.zoom = 2

      tile = randon_box.tile(line: line_index, column: col_index)
      expected_tile = {
        A: { x: 3 , y: 3 },
        B: { x: 5 , y: 3 },
        C: { x: 3 , y: 5 },
        D: { x: 5 , y: 5 },
      }
      expect(tile).to eq(expected_tile)
    end

    it 'last tile' do
      randon_box = RandonBox.new window: Support.window, height: 64, width: 32, x:0, y:0
      randon_box.stub(:__x__) { randon_box.x }
      randon_box.stub(:__y__) { randon_box.y }

      tile = randon_box.tile(line: 63, column: 31)
      expected_tile = {
        A: { x: 31 , y: 63 },
        B: { x: 32 , y: 63 },
        C: { x: 31 , y: 64 },
        D: { x: 32 , y: 64 },
      }
      expect(tile).to eq(expected_tile)
    end
  end
end
