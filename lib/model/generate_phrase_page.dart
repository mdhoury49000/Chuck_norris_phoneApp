import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart'; // Import the provider package
import '../phrases_cubit.dart';
class GeneratePhrasePage extends StatefulWidget {
  @override
  _GeneratePhrasePageState createState() => _GeneratePhrasePageState();
}

class _GeneratePhrasePageState extends State<GeneratePhrasePage> {
  String phrase = "Chargement de la phrase...";

  @override
  void initState() {
    super.initState();
    fetchPhrase();
  }

  fetchPhrase() async {
    final response = await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        phrase = data['value'];
      });
    } else {
      setState(() {
        phrase = "Erreur de chargement";
      });
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Génération de Phrase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(phrase, textAlign: TextAlign.center),
            ),
           ElevatedButton(
  onPressed: () {
    // ...

    context.read<PhrasesCubit>().savePhrase(phrase); // Use context.read to access the PhrasesCubit and call the savePhrase method
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Phrase enregistrée!'),
    ));
  },
  child: Text('Enregistrer cette phrase'),
),
            ElevatedButton(
              onPressed: fetchPhrase,
              child: Text('Nouvelle phrase'),
            ),
          ],
        ),
      ),
    );
  }
}
