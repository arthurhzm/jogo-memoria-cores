import 'package:flutter/material.dart';

void main() {
  runApp(const GeniusGame());
}

class GeniusGame extends StatelessWidget {
  const GeniusGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GeniusHome(),
    );
  }
}

class GeniusHome extends StatefulWidget {
  @override
  _GeniusHomeState createState() => _GeniusHomeState();
}

class _GeniusHomeState extends State<GeniusHome> {
  Map<String, bool> activeColors = {
    'red': false,
    'green': false,
    'blue': false,
    'yellow': false,
  };

  List<String> sequence = [];
  bool isUserTurn = false;

  void addRandomColor() {
    final random = activeColors.keys.toList()..shuffle();
    sequence.add(random.first);
  }

  void playSequence() async {
    isUserTurn = false;
    for (final color in sequence) {
      await _activateColor(color);
      await Future.delayed(const Duration(milliseconds: 500));
    }
    isUserTurn = true;
  }

  Future<void> _activateColor(String color) async {
    setState(() {
      activeColors[color] = true;
    });

    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      activeColors[color] = false;
    });
  }

  void startNewRound() {
    addRandomColor();
    playSequence();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genius Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: [
                  GeniusButton(
                    color: activeColors['red']! ? Colors.redAccent : Colors.red,
                    onTap: () {
                      if (isUserTurn) {
                        _activateColor('red');
                        _checkColor('red');
                      }
                    },
                  ),
                  GeniusButton(
                    color: activeColors['green']!
                        ? Colors.lightGreen
                        : Colors.green,
                    onTap: () {
                      if (isUserTurn) {
                        _activateColor('green');
                        _checkColor('green');
                      }
                    },
                  ),
                  GeniusButton(
                    color:
                        activeColors['blue']! ? Colors.lightBlue : Colors.blue,
                    onTap: () {
                      if (isUserTurn) {
                        _activateColor('blue');
                        _checkColor('blue');
                      }
                    },
                  ),
                  GeniusButton(
                    color: activeColors['yellow']!
                        ? Colors.yellowAccent
                        : Colors.yellow,
                    onTap: () {
                      if (isUserTurn) {
                        _activateColor('yellow');
                        _checkColor('yellow');
                      }
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: startNewRound,
              child: const Text('Iniciar'),
            ),
          ],
        ),
      ),
    );
  }

  int userIndex = 0;

  void _checkColor(String color) async {
    if (color == sequence[userIndex]) {
      userIndex++;
      if (userIndex == sequence.length) {
        userIndex = 0;
        await Future.delayed(const Duration(milliseconds: 1000));
        startNewRound();
      }
    } else {
      showGameOver();
    }
  }

  void showGameOver() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: Text('Você errou! Sua pontuação é: ${sequence.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                resetGame();
              },
              child: const Text('Try again'),
            ),
          ],
        );
      },
    );
  }

  void resetGame() {
    setState(() {
      sequence.clear();
      userIndex = 0;
      isUserTurn = false;
    });
  }
}

class GeniusButton extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  const GeniusButton({
    Key? key,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
