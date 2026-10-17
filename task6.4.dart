import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/item/:id',
      name: 'item',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ItemScreen(id: id);
      },
    ),
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);

void main() {
  runApp(MaterialApp.router(routerConfig: router));
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
            ElevatedButton(
              onPressed: () => context.goNamed('settings'),
              child: const Text('Go to Settings'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.goNamed(
                'item',
                pathParameters: {'id': '42'},
              ),
              child: const Text('Go to Item 42'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: const Center(child: Text('Settings Page')),
    );
  }
}

class ItemScreen extends StatelessWidget {
  final String id;

  const ItemScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Item')),
      body: Center(
        child: Text(
          'Item #$id',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('404')),
      body: const Center(
        child: Text(
          'Page not found',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
