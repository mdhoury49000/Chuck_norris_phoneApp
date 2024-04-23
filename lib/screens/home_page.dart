import 'package:chuck_norris_app/blocs/phrases_cubit.dart';
import 'package:chuck_norris_app/screens/settings_page.dart';
import 'package:flutter/material.dart';
import './generate_phrase_page.dart';
import 'collection_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
                'https://api.chucknorris.io/img/chucknorris_logo_coloured_small.png'),
            const SizedBox(
                height:
                    20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        BlocBuilder<PhrasesCubit, List<String>>(
                      builder: (context, phrases) {
                        return CollectionPage(
                            phrases:
                                phrases);
                      },
                    ),
                  ),
                );
              },
              child: const Text('Voir la collection'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GeneratePhrasePage()),
                );
              },
              child: const Text('Générer une phrase'),
            ),
          ],
        ),
      ),
    );
  }
}
