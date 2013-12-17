# encoding: UTF-8

Dado /^que comecei um jogo$/ do
  start_new_game
end

Quando /^começo um novo jogo$/ do
  start_new_game
end

Então /^vejo na tela:$/ do |text|
  assert_partial_output(text, all_stdout)
end
