import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import '../blocs/phrases_cubit.dart';
class GeneratePhrasePage extends StatefulWidget {
  const GeneratePhrasePage({super.key});

  @override
  GeneratePhrasePageState createState() => GeneratePhrasePageState();
}

class GeneratePhrasePageState extends State<GeneratePhrasePage> {
  String phrase = "Chargement de la phrase...";
  List<String> categories = ["Aucune"];
  String categorieSelected = "Aucune";

  @override
  void initState() {
    super.initState();
    fetchPhrase();
    fetchCategories();
  }

  fetchPhrase() async {
    var url = 'https://api.chucknorris.io/jokes/random';
    if (categorieSelected != "Aucune") {
      url += '?category=$categorieSelected';
    }
    final response = await http.get(Uri.parse(url));
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

  fetchCategories() async {
    final response = await http.get(Uri.parse('https://api.chucknorris.io/jokes/categories'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      for (String categorie in data) {
        setState(() {
          categories.add(categorie);
        });
      }
    } else {
      setState(() {
        categories = ["Erreur de chargement"];
      });
    }
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Génération de Phrase'),
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
                context.read<PhrasesCubit>().savePhrase(phrase);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Phrase enregistrée!'),
                ));
              },
              child: const Text('Enregistrer cette phrase'),
            ),
            ElevatedButton(
              onPressed: fetchPhrase,
              child: const Text('Nouvelle phrase'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Catégories :  ', textAlign: TextAlign.center),
                DropdownButton<String>(
                  value: categorieSelected,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      categorieSelected = value!;
                    });
                  },
                  items: categories.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
