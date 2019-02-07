require "game_flow"

RSpec.describe GameFlow do
  let(:ui) { double("ui").as_null_object }
  let(:game) { double("game",
                      state: :initial,
                      guessed_letters: []).as_null_object }

  subject(:game_flow) { GameFlow.new(game, ui) }

  describe "#start" do
    it "prints the initial message" do
      initial_message = "Bem-vindo ao jogo da forca!"
      expect(ui).to receive(:write).with(initial_message)

      game_flow.start
    end
  end

  describe "#next_step" do
    context "when the game is in the 'initial' state" do
      it "asks the player for the length of the word to be raffled" do
        question = "Qual o tamanho da palavra a ser sorteada?"
        expect(ui).to receive(:write).with(question)

        word_length = "3"
        expect(ui).to receive(:read).and_return(word_length)

        game_flow.next_step
      end

      context "and the player asks to raffle a word" do
        it "raffles a word with the given length" do
          word_length = 3
          allow(ui).to receive(:read).and_return(word_length.to_s)

          expect(game).to receive(:raffle).with(word_length)

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
    end

    context "when the game is in the 'word raffled' state" do
      before { allow(game).to receive(:state).and_return(:word_raffled) }

      it "asks the player to guess a letter" do
        question = "Qual letra você acha que a palavra tem?"
        expect(ui).to receive(:write).with(question)

        game_flow.next_step
      end

      context "and the player guess a letter with success" do
        before { allow(game).to receive(:guess_letter).and_return(true) }

        it "prints a success message" do
          success_message = "Você adivinhou uma letra com sucesso."
          expect(ui).to receive(:write).with(success_message)

          game_flow.next_step
        end

        it "prints the guessed letters" do
          allow(game).to receive(:raffled_word).and_return("hey")
          allow(game).to receive(:guessed_letters).and_return(["e"])

          expect(ui).to receive(:write).with("_ e _")

          game_flow.next_step
        end
      end

      context "and the player fails to guess a letter" do
        before { allow(game).to receive(:guess_letter).and_return(false) }

        it "prints an error message" do
          error_message = "Você errou a letra."
          expect(ui).to receive(:write).with(error_message)

          game_flow.next_step
        end

        it "prints the list of the missed parts" do
          allow(game).to receive(:missed_parts).and_return(["cabeça"])

          missed_parts_message = "O boneco da forca perdeu as " <<
                                 "seguintes partes do corpo: cabeça"
          expect(ui).to receive(:write).with(missed_parts_message)

          game_flow.next_step
        end
      end
    end

    context "when the game is in the 'ended' state" do
      before { allow(game).to receive(:state).and_return(:ended) }

      it "prints a success message when the player win" do
        allow(game).to receive(:player_won?).and_return(true)

        expect(ui).to receive(:write).with("Você venceu! :)")

        game_flow.next_step
      end

      it "prints a defeat message when the player lose" do
        allow(game).to receive(:player_won?).and_return(false)

        expect(ui).to receive(:write).with("Você perdeu. :(")

        game_flow.next_step
      end
    end

    it "finishes the game when the player asks to" do
      player_input = "fim"
      allow(ui).to receive(:read).and_return(player_input)

      allow(game).to receive(:state).and_return(:initial)
      expect(game).to receive(:finish)
      game_flow.next_step

      allow(game).to receive(:state).and_return(:word_raffled)
      expect(game).to receive(:finish)
      game_flow.next_step
    end
  end
end
