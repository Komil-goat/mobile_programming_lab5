import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: GreetingScreen(),
    ),
  );
}

class GreetingScreen extends StatefulWidget {
  const GreetingScreen({super.key});

  @override
  State<GreetingScreen> createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Greeting')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelloScreen(name: _controller.text),
                  ),
                );
              },
              child: const Text('Greet'),
            ),
          ],
        ),
      ),
    );
  }
}

class HelloScreen extends StatelessWidget {
  final String name;

  const HelloScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello')),
      body: Center(
        child: Text(
          'Hello, $name!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
