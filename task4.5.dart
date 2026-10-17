import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MovieListScreen(),
        '/rate': (context) => const RateScreen(),
      },
    ),
  );
}

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  int? _rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _rating != null ? 'Inception: $_rating/5' : 'Inception: not rated',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.pushNamed<int>(
                  context,
                  '/rate',
                  arguments: 'Inception',
                );
                if (result != null) {
                  setState(() {
                    _rating = result;
                  });
                }
              },
              child: const Text('Rate Inception'),
            ),
          ],
        ),
      ),
    );
  }
}

class RateScreen extends StatelessWidget {
  const RateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Rate: $movie')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 1; i <= 5; i++)
              IconButton(
                icon: const Icon(Icons.star, size: 36),
                onPressed: () => Navigator.pop(context, i),
              ),
          ],
        ),
      ),
    );
  }
}
