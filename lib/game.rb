# encoding: UTF-8

require_relative 'cli_ui'
require_relative 'word_raffler'

class Game
  attr_accessor :raffled_word
  attr_accessor :state

  def initialize(word_raffler = WordRaffler.new)
    @word_raffler = word_raffler
    @state = :initial
  end

  def raffle(word_length)
    if @raffled_word = @word_raffler.raffle(word_length)
      @state = :word_raffled
    end
  end

  def finish
    @state = :ended
  end

  def ended?
    @state == :ended
  end
end
