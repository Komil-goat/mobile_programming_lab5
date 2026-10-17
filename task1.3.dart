import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: LoginApp(),
    ),
  );
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          child: const Text('Sign In'),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: const Color.fromARGB(255, 184, 215, 240),
          child: const Center(
            child: Text(
              'Home Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold, 
              ),
            ),
          ),
        ),
      ),
    );
  }
}