import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: CounterScreen(),
    ),
  );
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter: $_counter',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push<int>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditorScreen(value: _counter),
                  ),
                );
                if (result != null) {
                  setState(() {
                    _counter = result;
                  });
                }
              },
              child: const Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditorScreen extends StatefulWidget {
  final int value;

  const EditorScreen({super.key, required this.value});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editor'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_value',
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _value--;
                    });
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 24),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _value++;
                    });
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, _value),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
