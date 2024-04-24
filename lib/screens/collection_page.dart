import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/phrases_cubit.dart';

class CollectionPage extends StatelessWidget {
  final List<String> phrases;

  const CollectionPage({super.key, required this.phrases});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection de Phrases'),
      ),
      body: phrases.isEmpty ? const Center(child: Text('Pas de phrases dans la collection...')) : ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              title: Text(
                phrases[index],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: const Icon(Icons.delete),
              onTap: () {
                context.read<PhrasesCubit>().deletePhrase(phrases[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
