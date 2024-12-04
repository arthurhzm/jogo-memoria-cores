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

class GeniusHome extends StatelessWidget {
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
              color: Colors.red,
              onTap: () => print("Red"),
            ),
            GeniusButton(
              color: Colors.green,
              onTap: () => print("Green"),
            ),
            GeniusButton(
              color: Colors.blue,
              onTap: () => print("Blue"),
            ),
            GeniusButton(
              color: Colors.yellow,
              onTap: () => print("Yellow"),
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
