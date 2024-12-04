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

  void _activateColor(String color) async {
    setState(() {
      activeColors[color] = true;
    });

    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      activeColors[color] = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Genius Game'),
      ),
      body: Center(
          child: SizedBox(
        width: 300,
        height: 300,
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: [
            GeniusButton(
              color: activeColors['red']! ? Colors.red[700]! : Colors.red,
              onTap: () => _activateColor('red'),
            ),
            GeniusButton(
              color: activeColors['green']! ? Colors.green[700]! : Colors.green,
              onTap: () => _activateColor('green'),
            ),
            GeniusButton(
              color: activeColors['blue']! ? Colors.blue[700]! : Colors.blue,
              onTap: () => _activateColor('blue'),
            ),
            GeniusButton(
              color: activeColors['yellow']! ? Colors.yellow[700]! : Colors.yellow,
              onTap: () => _activateColor('yellow'),
            ),
          ],
        ),
      )),
    );
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
