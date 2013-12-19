# language: pt

Funcionalidade: Adivinhar letra
  Após a palavra do jogo ser sorteada, o jogador pode começar a tentar
  adivinhar as letras da palavra.

  Cada vez que ele acerta uma letra, o jogo mostra para ele em que
  posição dentro da palavra está a letra que ele acertou.

  Cada vez que o jogador erra uma letra, uma parte do boneco da
  forca aparece na forca. O jogador pode errar no máximo seis vezes, que
  correspondem às seis partes do boneco: cabeça, corpo, braço esquerdo,
  braço direito, perna esquerda, perna direita.


  Cenário: Sucesso ao adivinhar letra
    Se o jogador adivinhar a letra com sucesso, o jogo mostra uma
    mensagem de sucesso e mostra em que posição está a letra que o
    jogador adivinhou.

  Cenário: Erro ao adivinhar letra
    Se o jogador errar ao tentar adivinhar a letra, o jogo mostra uma
    mensagem de erro e mostra quais as partes o boneco da forca já
    perdeu.

  Cenário: Jogador advinha com sucesso duas vezes
    Quanto mais o jogador for acertando, mais o jogo vai mostrando pra
    ele as letras que ele adivinhou.

  Cenário: Jogador erra três vezes ao adivinhar letra
    Quanto mais o jogador for errando, mais partes do boneco da forca
    são perdidas.
