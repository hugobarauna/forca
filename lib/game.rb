# encoding: UTF-8

require_relative 'cli_ui'
require_relative 'word_raffler'

class Game
  attr_accessor :raffled_word

  def initialize(ui = CliUi.new, word_raffler = WordRaffler.new)
    @ui = ui
    @word_raffler = word_raffler
    @ended = false
  end

  def start
    initial_message = "Bem-vindo ao jogo da forca!"
    @ui.write(initial_message)
  end

  def ended?
    @ended
  end

  def next_step
    @ui.write("Qual o tamanho da palavra a ser sorteada?")
    player_input = @ui.read.strip

    if player_input == "fim"
      @ended = true
    else
      if @raffled_word = @word_raffler.raffle(player_input.to_i)
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

    @raffled_word.length.times do
      letters_feedback << "_ "
    end

    letters_feedback.strip!
    @ui.write(letters_feedback)
  end
end
