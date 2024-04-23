import 'package:chuck_norris_app/screens/credit_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.apps),
            title: Text('Catégories'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Crédits'),
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