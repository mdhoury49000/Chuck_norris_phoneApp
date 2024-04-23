import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/phrases_cubit.dart';

class CollectionPage extends StatelessWidget {
  final List<String> phrases;

  CollectionPage({Key? key, required this.phrases}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection de Phrases'),
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              title: Text(
                phrases[index],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.delete),
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
