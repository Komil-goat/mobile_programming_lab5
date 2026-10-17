import 'package:flutter/material.dart';

// when I press system back button it does go back from C to B, but when I press it again after going from C to B, then it does not work.

void main() {
  runApp(
    const MaterialApp(
      home: AppA(),
    ),
  );
}

class AppA extends StatelessWidget {
  const AppA({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App A'),
        backgroundColor: const Color.fromARGB(255, 114, 182, 238),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AppB()),
            );
          },
          child: const Text('Go to App B'),
        ),
      ),
    );
  }
}


class AppB extends StatelessWidget {
  const AppB({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App B'),
        backgroundColor: const Color.fromARGB(255, 93, 93, 255),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AppC()),
            );
          },
          child: const Text('Go to App C'),
        ),
      ),
    );
  }
}

class AppC extends StatelessWidget {
  const AppC({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App C'),
        backgroundColor: const Color.fromARGB(255, 128, 26, 56),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back to App B'),
        ),
      ),
    );
  }
}