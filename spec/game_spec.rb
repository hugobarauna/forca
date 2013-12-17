# encoding: UTF-8

require 'spec_helper'
require 'game'

describe Game do
  describe "#start" do
    it "prints the initial message" do
      output = double("output")
      game = Game.new(output)

      initial_message = "Bem-vindo ao jogo da forca!"
      expect(output).to receive(:puts).with(initial_message)


      game.start
    end
  end
end
