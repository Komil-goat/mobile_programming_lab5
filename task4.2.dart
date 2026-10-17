import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/square': (context) => const SquareScreen(),
      },
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (final n in [1, 2, 3])
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/square',
                      arguments: n,
                    );
                  },
                  child: Text('$n'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SquareScreen extends StatelessWidget {
  const SquareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final number = ModalRoute.of(context)!.settings.arguments as int;
    final square = number * number;
    return Scaffold(
      appBar: AppBar(title: const Text('Square')),
      body: Center(
        child: Text(
          '$number squared is $square',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
