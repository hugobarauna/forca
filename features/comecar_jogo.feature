# language: pt

Funcionalidade: Começar jogo
  Para poder passar o tempo
  Como jogador
  Quero poder começar um novo jogo

  Cenário: Começo de novo jogo com sucesso
    Ao começar o jogo, é mostrada a mensagem inicial para o jogador.

    Quando começo um novo jogo
    Então vejo na tela:
      """
      Bem-vindo ao jogo da forca!
      """

  @wip
  Cenário: Sorteio da palavra com sucesso
    Após o jogador começar o jogo, ele deve escolher o tamanho da
    palavra a ser adivinhada. Ao escolher o tamanho, o jogo sorteia a
    palavra e mostra na tela um "_" para cada letra que a palavra
    sorteada tem.

    Dado que comecei um jogo
    Quando escolho que a palavra a ser sorteada deverá ter "4" letras
    Então vejo na tela:
      """
      _ _ _ _
      """
