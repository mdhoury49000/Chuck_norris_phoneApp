import 'package:chuck_norris_app/blocs/phrases_cubit.dart';
import 'package:chuck_norris_app/screens/settings_page.dart';
import 'package:flutter/material.dart';
import './generate_phrase_page.dart';
import 'collection_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
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
            SizedBox(
                height:
                    20), // Ajout d'un espace entre l'image et le premier bouton
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
                                phrases); // Passer la liste des phrases à la page de collection
                      },
                    ),
                  ),
                );
              },
              child: Text('Voir la collection'),
            ),
            SizedBox(height: 10), // Ajout d'un espace entre les boutons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GeneratePhrasePage()),
                );
              },
              child: Text('Générer une phrase'),
            ),
          ],
        ),
      ),
    );
  }
}
