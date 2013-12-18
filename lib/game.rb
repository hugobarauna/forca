# encoding: UTF-8

require_relative 'cli_ui'
require_relative 'word_raffler'

class Game
  attr_accessor :raffled_word

  def initialize(word_raffler = WordRaffler.new)
    @word_raffler = word_raffler
    @ended = false
  end

  def raffle(word_length)
    @raffled_word = @word_raffler.raffle(word_length)
  end

  def finish
    @ended = true
  end

  def ended?
    @ended
  end
end
