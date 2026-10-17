import 'package:flutter/material.dart';

class User {
  final String name;
  final int age;
  final String city;

  const User(this.name, this.age, this.city);
}

const users = [
  User('Alice', 28, 'New York'),
  User('Bob', 34, 'London'),
  User('Charlie', 22, 'Paris'),
  User('Diana', 31, 'Tokyo'),
];

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const UserListScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    ),
  );
}

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: ListView(
        children: [
          for (final u in users)
            ListTile(
              title: Text(u.name),
              subtitle: Text(u.city),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/profile',
                  arguments: u,
                );
              },
            ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${user.name}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('Age: ${user.age}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text('City: ${user.city}', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
