import 'package:chuck_norris_app/screens/credit_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/phrases_cubit.dart';

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
            leading: const Icon(Icons.delete_forever),
            title: const Text('Vider la collection'),
            onTap: () {
              context.read<PhrasesCubit>().deleteAllPhrases();
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Phrases supprimés !'),
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Crédits'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreditPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}