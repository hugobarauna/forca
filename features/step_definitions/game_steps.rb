# encoding: UTF-8

Dado /^que comecei um jogo$/ do
  start_new_game
end

Quando /^começo um novo jogo$/ do
  start_new_game
end

Quando /^escolho que a palavra a ser sorteada deverá ter "(.*?)" letras\
$/ do |number_of_letters|
  type(number_of_letters)
end


Quando /^termino o jogo$/ do
  type("fim")
end

Então /^o jogo termina com a seguinte mensagem na tela:$/ do |text|
  assert_passing_with(text)
end
