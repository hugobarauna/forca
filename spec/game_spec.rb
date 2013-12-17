# encoding: UTF-8

require 'spec_helper'
require 'game'

describe Game do
  let(:output) { double("output") }
  let(:input)  { double("input") }

  subject(:game) { Game.new(output, input) }

  describe "#start" do
    it "prints the initial message" do
      initial_message = "Bem-vindo ao jogo da forca!"
      expect(output).to receive(:puts).with(initial_message)

      game.start
    end
  end

  describe "#ended?" do
    it "returns false when the game just started" do
      expect(game).not_to be_ended
    end
  end

  describe "#next_step" do
    context "when the game just started" do
      it "asks the player for the length of the word to be raffled" do
        question = "Qual o tamanho da palavra a ser sorteada?"
        expect(output).to receive(:puts).with(question)

        expect(input).to receive(:gets)

        game.next_step
      end
    end
  end
end
