# encoding: UTF-8

Quando /^começo um novo jogo$/ do
  game = Game.new
  game.start
end

Então /^vejo na tela:$/ do |string|
  pending
end
