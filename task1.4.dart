import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Step1Screen(),
    ),
  );
}

class Step1Screen extends StatelessWidget {
  const Step1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Step 1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Step2Screen()),
            );
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}

class Step2Screen extends StatelessWidget {
  const Step2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Step 2')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Step3Screen()),
            );
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}

class Step3Screen extends StatelessWidget {
  const Step3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Step 3')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Step4Screen()),
            );
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}

class Step4Screen extends StatelessWidget {
  const Step4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Step 4')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: const Text('Finish'),
        ),
      ),
    );
  }
}
