import 'package:flutter/material.dart';
import './model/generate_phrase_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network('https://api.chucknorris.io/img/chucknorris_logo_coloured_small.png'),
            SizedBox(height: 20), // Ajout d'un espace entre l'image et le premier bouton
            ElevatedButton(
              onPressed: () => print('Regarder sa collection'),
              child: Text('Regarder sa collection'),
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
