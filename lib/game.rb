# encoding: UTF-8

class Game
  def initialize(output = STDOUT)
    @output = output
    @ended = false
  end

  def start
    initial_message = "Bem-vindo ao jogo da forca!"
    @output.puts initial_message
  end

  def ended?
    @ended
  end

  def next_step
    @output.puts("Qual o tamanho da palavra a ser sorteada?")
  end
end
