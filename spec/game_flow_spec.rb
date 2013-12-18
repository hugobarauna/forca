# encoding: UTF-8

require 'spec_helper'
require 'game_flow'

describe GameFlow do
  let(:ui) { double("ui").as_null_object }
  let(:game) { double("game").as_null_object }

  subject(:game_flow) { GameFlow.new(game, ui) }

  describe "#start" do
    it "prints the initial message" do
      initial_message = "Bem-vindo ao jogo da forca!"
      expect(ui).to receive(:write).with(initial_message)

      game_flow.start
    end
  end

  describe "#next_step" do
    context "when the game just started" do
      it "asks the player for the length of the word to be raffled" do
        question = "Qual o tamanho da palavra a ser sorteada?"
        expect(ui).to receive(:write).with(question)

        word_length = "3"
        expect(ui).to receive(:read).and_return(word_length)

        game_flow.next_step
      end
    end

    context "when the player asks to raffle a word" do
      it "raffles a word with the given length" do
        word_length = "3"
        allow(ui).to receive(:read).and_return(word_length)

        expect(game).to receive(:raffle).with(word_length.to_i)

        game_flow.next_step
      end

      it "prints a '_' for each letter in the raffled word" do
        word_length = "3"
        allow(ui).to receive(:read).and_return(word_length)
        allow(game).to receive(:raffle).and_return("mom")
        allow(game).to receive(:raffled_word).and_return("mom")

        expect(ui).to receive(:write).with("_ _ _")

        game_flow.next_step
      end

      it "tells if it's not possible to raffle with the given length" do
        word_length = "20"
        allow(ui).to receive(:read).and_return(word_length)
        allow(game).to receive(:raffle).and_return(nil)

        error_message = "Não temos uma palavra com o tamanho " <<
                       "desejado,\n" <<
                       "é necessário escolher outro tamanho."

        expect(ui).to receive(:write).with(error_message)

        game_flow.next_step
      end
    end

    it "finishes the game when the player asks to" do
      player_input = "fim"
      allow(ui).to receive(:read).and_return(player_input)

      expect(game).to receive(:finish)

      game_flow.next_step
    end
  end
end
