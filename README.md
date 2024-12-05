# Genius Flutter Game

Um aplicativo simples baseado no clássico jogo Genius, onde o jogador deve memorizar e reproduzir sequências de cores que aumentam progressivamente a cada rodada. Desenvolvido em Flutter, o app é uma ótima introdução para quem deseja aprender sobre widgets, estados e lógica de jogos simples.

## 🚀 Funcionalidades

- Interface intuitiva com 4 botões coloridos que piscam em sequência.
- Sequências geradas de forma aleatória.
- Verificação da entrada do jogador para determinar acertos e erros.
- Sistema de pontuação exibido em tempo real.

## 🛠️ Requisitos

- Flutter SDK: 3.0 ou superior
- Dart SDK: 2.19 ou superior
- Android Studio (ou qualquer editor com suporte ao Flutter)

## 📂 Estrutura do Projeto

```plaintext
genius_app/
├── android/                 # Configurações específicas do Android
├── ios/                     # Configurações específicas do iOS
├── lib/
│   ├── main.dart            # Código principal do aplicativo
├── pubspec.yaml             # Configurações do Flutter e dependências
```

## 🏗️ Instalação e Execução

1. Clone este repositório

```bash
git clone https://github.com/arthurhzm/jogo-memoria-cores.git
cd genius_app
```

2. Instale as dependências

Certifique-se de que o Flutter esteja instalado e configurado corretamente. Depois, rode:

```bash
flutter pub get
```

3. Execute o aplicativo

Para rodar o app em um dispositivo ou emulador:

```bash
flutter run
```

## 🖼️ Demonstração

A interface do jogo apresenta um layout centralizado com 4 botões coloridos que piscam à medida que o jogo avança:

### Tela inicial:

O botão "Iniciar" aparece para dar início à primeira sequência.

### Jogo em andamento:

O jogador precisa clicar nas cores na ordem correta à medida que elas piscam.

### Erro:

O jogo reinicia a sequência se o jogador errar.

## 🧩 Estrutura do Código

### Arquivos principais

`main.dart`

O arquivo principal que contém:

- Configuração inicial do jogo.
- Lógica para controle de estados.
- Funções de verificação da sequência.

## 🛠️ Como Funciona o Jogo

1. O jogador clica no botão "Iniciar".
2. Uma sequência aleatória de cores é gerada.
3. As cores piscam na tela (com tempo entre cada cor).
4. O jogador deve repetir a sequência ao clicar nos botões coloridos.
5. Errou? O jogo reinicia e a pontuação é zerada.
6. Acertou? A sequência aumenta e o jogador ganha pontos.

## 💡 Personalizações

Se quiser modificar o jogo, veja algumas sugestões:

### Dificuldade:

Reduza o tempo de exibição das cores para aumentar o desafio.

### Interface:

Adicione animações ou textos de feedback (ex: "Acertou!" ou "Errou!").

### Modo Áudio:

Reative os sons ao piscar os botões com bibliotecas como just_audio.

### Ranking:

Implemente um sistema de pontuação máxima usando armazenamento local.

## 🤝 Contribuindo

Contribuições são sempre bem-vindas! Para contribuir:

1. Faça um fork do projeto.
2. Crie uma branch para sua funcionalidade ou correção de bug:

```bash
git checkout -b minha-feature
```

3. Commit suas alterações:

```bash
git commit -m 'Adiciona nova funcionalidade'
```

4. Envie para a branch principal:

```bash
git push origin minha-feature
```

## 📄 Licença

Este projeto está licenciado sob a licença MIT. Sinta-se livre para usar, modificar e distribuir!

## 🧙‍♂️ Autor

Arthur Marena

Um desenvolvedor apaixonado por desafios e aprendizados! Se tiver dúvidas ou sugestões, é só chamar. 😎
