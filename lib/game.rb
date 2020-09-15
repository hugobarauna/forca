require_relative "cli_ui"
require_relative "word_raffler"

class Game
  HANGMAN_PARTS = [
    "cabeça", "corpo", "braço esquerdo",
    "braço direito", "perna esquerda", "perna direita"
  ]

  attr_accessor :raffled_word
  attr_accessor :state
  attr_reader   :guessed_letters
  attr_reader   :missed_parts

  def initialize(word_raffler = WordRaffler.new)
    @word_raffler = word_raffler
    @state = :initial
    @guessed_letters = []
    @missed_parts = []
    @wrong_guesses = 0
  end

  def raffle(word_length)
    @raffled_word = @word_raffler.raffle(word_length)

    if @raffled_word
      @state = :word_raffled
    end
  end

  def guess_letter(letter)
    return false if letter.strip.empty?

    if @raffled_word.include?(letter)
      @guessed_letters << letter
      @guessed_letters.uniq!

      @state = :ended if all_letters_were_guessed?

      true
    else
      @missed_parts << HANGMAN_PARTS[@wrong_guesses]
      @wrong_guesses += 1

      @state = :ended if @wrong_guesses == 6

      false
    end
  end

  def finish
    @state = :ended
  end

  def ended?
    @state == :ended
  end

  def player_won?
    return false if @state != :ended

    all_letters_were_guessed?
  end

  private

  def all_letters_were_guessed?
    raffled_word_letters = @raffled_word.to_s.chars.uniq

    @guessed_letters.sort == raffled_word_letters.sort
  end
end
