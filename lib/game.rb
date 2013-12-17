# encoding: UTF-8

require_relative 'cli_ui'

class Game
  attr_accessor :raffled_word

  def initialize(ui = CliUi.new)
    @ui = ui
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
      raffle_word(player_input.to_i)
      print_letters_feedback
    end
  end

  private
  def raffle_word(word_length)
    words = %w(hi mom game fruit)
    @raffled_word = words.detect { |word| word.length == word_length }
  end

  def print_letters_feedback
    letters_feedback = ""

    @raffled_word.length.times do
      letters_feedback << "_ "
    end

    letters_feedback.strip!
    @ui.write(letters_feedback)
  end
end
