require 'spec_helper'

describe RandonBox do

  context 'generate randon image' do
    let(:randon_box) { RandonBox.new(width: 64, height: 64) }
    let(:colors) { [:NONE, :BLACK, :GRAY, :WHITE, :AQUA, :RED, :GREEN, :BLUE, :YELLOW, :FUCHSIA, :CYAN] }

    it 'with right width' do
      expect(randon_box.image.count).to be(64)
    end

    it 'with right height' do
      expect(randon_box.image.sample.count).to be(64)
    end

    it 'with colors' do
      color = randon_box.image.sample.sample
      expect(colors.include? color).to be_true
    end
  end

  context 'mount tile to draw' do
    let(:line_index) { 1 }
    let(:col_index) { 1 }
    let(:randon_box) { RandonBox.new(height: 64, width: 64, x: 1 , y: 1, zoom: 1) }

    it 'without zoom' do
      tile = randon_box.tile(line_index, col_index)
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

      tile = randon_box.tile(line_index, col_index)
      expected_tile = {
        A: { x: 3 , y: 3 },
        B: { x: 5 , y: 3 },
        C: { x: 3 , y: 5 },
        D: { x: 5 , y: 5 },
      }
      expect(tile).to eq(expected_tile)
    end
  end
end
