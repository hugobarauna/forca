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
    @ui.write("Qual o tamanho da palavra a ser sorteada?")
    player_input = @ui.read.strip

    if player_input == "fim"
      @game.finish
    else
      if @game.raffle(player_input.to_i)
        print_letters_feedback
      else
        error_message = "Não temos uma palavra com o tamanho " <<
                        "desejado,\n" <<
                        "é necessário escolher outro tamanho."

        @ui.write(error_message)
      end
    end
  end

  private
  def print_letters_feedback
    letters_feedback = ""

    @game.raffled_word.length.times do
      letters_feedback << "_ "
    end

    letters_feedback.strip!

    @ui.write(letters_feedback)
  end
end
