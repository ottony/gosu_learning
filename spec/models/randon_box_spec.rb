require 'spec_helper'

describe RandonBox do
  let(:randon_box) { RandonBox.new(width: 64, height: 64) }
  let(:colors) { [:NONE, :BLACK, :GRAY, :WHITE, :AQUA, :RED, :GREEN, :BLUE, :YELLOW, :FUCHSIA, :CYAN] }

  context 'generate randon image' do
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
end
