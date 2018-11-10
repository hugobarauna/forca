Dado /^o jogo tem as possíveis palavras para sortear:$/ do |words_table|
  words = words_table.rows.map(&:last).join(" ")
  set_rafflable_words(words)
end

Dado /^que comecei um jogo$/ do
  start_new_game
end

Dado /^que escolhi que a palavra a ser sorteada deverá ter "(.*?)"\
 letras\
$/ do |number_of_letters|
  type(number_of_letters)
end

Quando /^começo um novo jogo$/ do
  start_new_game
end

Quando /^escolho que a palavra a ser sorteada deverá ter "(.*?)" letras\
$/ do |number_of_letters|
  type(number_of_letters)
end

Quando /^tento adivinhar que a palavra tem a letra "(.*?)"$/ do |letter|
  type(letter)
end

Quando /^tento adivinhar que a palavra tem a letra "(.*?)" \
"(.*?)" vezes$/ do |letter, number_of_guesses|

  number_of_guesses.to_i.times do
    type(letter)
  end
end

Quando /^termino o jogo$/ do
  type("fim")
end

Então /^o jogo termina com a seguinte mensagem na tela:$/ do |text|
  expect(last_command_started).to be_successfully_executed
  expect(last_command_started.output).to include(text)
end

Então /^o jogo mostra que eu adivinhei uma letra com sucesso$/ do
  expect(last_command_started).to have_output(
    /Você adivinhou uma letra com sucesso./
  )
end

Então /^o jogo mostra que eu errei a adivinhação da letra$/ do
  expect(last_command_started).to have_output(/Você errou a letra./)
end
