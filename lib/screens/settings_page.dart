import 'package:chuck_norris_app/screens/credit_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.apps),
            title: const Text('Catégories'),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Crédits'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreditPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}