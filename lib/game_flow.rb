# encoding: UTF-8

require_relative 'cli_ui'
require_relative 'game'

require 'forwardable'

# Esta classe é responsável pelo fluxo do jogo.
#
class GameFlow
  extend Forwardable
  delegate :ended? => :@game

  def initialize(game = Game.new, ui = CliUi.new)
    @game = game
    @ui = ui
  end

  def start
    initial_message = "Bem-vindo ao jogo da forca!"
    @ui.write(initial_message)
  end

  def next_step
    case @game.state
    when :initial
      ask_to_raffle_a_word
    when :word_raffled
      ask_to_guess_a_letter
    end

    print_game_final_result if @game.ended?
  end

  private
  def ask_to_raffle_a_word
    ask_the_player("Qual o tamanho da palavra a ser sorteada?") do |length|
      if @game.raffle(length.to_i)
        @ui.write(guessed_letters)
      else
        error_message = "Não temos uma palavra com o tamanho " <<
        "desejado,\n" <<
        "é necessário escolher outro tamanho."

        @ui.write(error_message)
      end
    end
  end

  def ask_the_player(question)
    @ui.write(question)
    player_input = @ui.read.strip

    if player_input == "fim"
      @game.finish
    else
      yield player_input.strip
    end
  end

  def ask_to_guess_a_letter
    ask_the_player("Qual letra você acha que a palavra tem?") do |letter|
      if @game.guess_letter(letter)
        @ui.write("Você adivinhou uma letra com sucesso.")
        @ui.write(guessed_letters)
      else
        @ui.write("Você errou a letra.")

        missed_parts_message = "O boneco da forca perdeu as " <<
        "seguintes partes do corpo: "
        missed_parts_message << @game.missed_parts.join(", ")
        @ui.write(missed_parts_message)
      end
    end
  end

  def guessed_letters
    letters = ""

    @game.raffled_word.each_char do |letter|
      if @game.guessed_letters.include?(letter)
        letters << letter + " "
      else
        letters << "_ "
      end
    end

    letters.strip!
  end

  def print_game_final_result
    if @game.player_won?
      @ui.write("Você venceu! :)")
    end
  end
end
