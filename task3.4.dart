import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ColourScreen(),
    ),
  );
}

class ColourScreen extends StatefulWidget {
  const ColourScreen({super.key});

  @override
  State<ColourScreen> createState() => _ColourScreenState();
}

class _ColourScreenState extends State<ColourScreen> {
  Color _currentColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick a colour')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              color: _currentColor,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final color = await Navigator.push<Color>(
                  context,
                  MaterialPageRoute(builder: (context) => const ColourPickerScreen()),
                );
                if (color != null) {
                  setState(() {
                    _currentColor = color;
                  });
                }
              },
              child: const Text('Choose colour'),
            ),
          ],
        ),
      ),
    );
  }
}

class ColourPickerScreen extends StatelessWidget {
  const ColourPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose a colour')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context, Colors.red),
              child: Container(
                width: 60,
                height: 60,
                color: Colors.red,
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () => Navigator.pop(context, Colors.green),
              child: Container(
                width: 60,
                height: 60,
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () => Navigator.pop(context, Colors.blue),
              child: Container(
                width: 60,
                height: 60,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
