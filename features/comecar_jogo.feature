# language: pt

Funcionalidade: Começar jogo
  Para poder passar o tempo
  Como jogador
  Quero poder começar um novo jogo

  Cenário: Começo de novo jogo com sucesso
    Ao começar o jogo, é mostrada a mensagem inicial para o jogador.

    Quando começo um novo jogo
    E termino o jogo
    Então o jogo termina com a seguinte mensagem na tela:
      """
      Bem-vindo ao jogo da forca!
      """

  Cenário: Sorteio da palavra com sucesso
    Após o jogador começar o jogo, ele deve escolher o tamanho da
    palavra a ser adivinhada. Ao escolher o tamanho, o jogo sorteia a
    palavra e mostra na tela um "_" para cada letra que a palavra
    sorteada tem.

    Dado que comecei um jogo
    Quando escolho que a palavra a ser sorteada deverá ter "4" letras
    E termino o jogo
    Então o jogo termina com a seguinte mensagem na tela:
      """
      _ _ _ _
      """

  Cenário: Sorteio da palavra sem sucesso
    Se o jogador pedir pro jogo sortear uma palavra com um tamanho
    que o jogo não tem disponível, o jogador deve ser avisado disso
    e o jogo deve pedir pro jogador sortear outra palavra.

    Dado que comecei um jogo
    Quando escolho que a palavra a ser sorteada deverá ter "20" letras
    E termino o jogo
    Então o jogo termina com a seguinte mensagem na tela:
      """
      Não temos uma palavra com o tamanho desejado,
      é necessário escolher outro tamanho.
      Qual o tamanho da palavra a ser sorteada?
      """
