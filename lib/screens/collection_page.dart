import 'package:flutter/material.dart';

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
          return ListTile(
            title: Text(phrases[index]),
          );
        },
      ),
    );
  }
}
