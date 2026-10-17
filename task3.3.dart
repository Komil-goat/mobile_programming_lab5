import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final String email;

  const Contact(this.name, this.phone, this.email);
}

const contacts = [
  Contact('Alice Johnson', '+1 555-0101', 'alice@example.com'),
  Contact('Bob Smith', '+1 555-0102', 'bob@example.com'),
  Contact('Charlie Brown', '+1 555-0103', 'charlie@example.com'),
  Contact('Diana Prince', '+1 555-0104', 'diana@example.com'),
  Contact('Eve Adams', '+1 555-0105', 'eve@example.com'),
];

void main() {
  runApp(
    const MaterialApp(
      home: ContactListScreen(),
    ),
  );
}

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView(
        children: [
          for (final c in contacts)
            ListTile(
              title: Text(c.name),
              subtitle: Text(c.phone),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactScreen(contact: c),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  final Contact contact;

  const ContactScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  contact.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.phone, size: 20),
                    const SizedBox(width: 8),
                    Text(contact.phone, style: const TextStyle(fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.email, size: 20),
                    const SizedBox(width: 8),
                    Text(contact.email, style: const TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
