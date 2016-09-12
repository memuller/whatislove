# Como LOVE funciona

## Executando LOVE

## Estrutura do LOVE

Você desenvolve coisas em LOVE tirando proveito de seus __callbacks__. Callback é um método que você cria com um nome ou em um local específico sabendo que outra parte do programa irá chamar estes métodos em momentos específicos, caso eles existam. LOVE tem muitos callbacks, mas três são mais importantes:

* __love.load__ , que é chamado __uma vez ao iniciar o jogo__; essencial para definir variáveis, carregar coisas, configurações, etc;
* __love.update__ é chamado __em todo quadro do jogo__; __quadro__ sendo a _unidade de tempo_ do jogo. Normalmente, existirão vários quadros por segundo, então este método será chamado constantemente e é nele que você irá efetivamente fazer o jogo se comportar de forma interativa.
* __love.draw__ é chamado também em todo quadro do jogo, logo após o `love.update`, para __desenhar a tela__.

Um exemplo simples:

```lua
love.load()
  x = 0
end

love.update()
  x = x + 1
end

love.draw()
  -- argumentos do print: texto, posição horizontal, posição vertical
  love.graphics.print('Este texto vai se mover na horizontal', x, 20)
end
```
A intenção deste programa é fazer um texto que irá constantemente caminhar para a direita. Isso é feito incrementando constantemente uma variável `x`, que é usada para determinar a posição horizontal do texto.

Note como todos os três callbacks são necessários para isso:

* o _load_ é necessário para colocar um valor inicial nesta variável; do contrário seria impossível incrementá-la;
* o _update_ efetivamente incrementa a variável;
* o _draw_ desenha o texto, do contrário nada disso seria visível.
