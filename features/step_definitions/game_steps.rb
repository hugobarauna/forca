# encoding: UTF-8

Quando /^começo um novo jogo$/ do
  steps %{
    * I run `forca` interactively
  }
end

Então /^vejo na tela:$/ do |text|
  steps %{
    * the stdout should contain "#{text}"
  }
end
