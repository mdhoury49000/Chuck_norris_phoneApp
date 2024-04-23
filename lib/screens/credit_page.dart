import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditPage extends StatelessWidget {
  const CreditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crédits'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Développé par :',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Center(
              child: TextButton(
                onPressed: _launchUrlMat,
                child: Text('Antony Portebois'),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: _launchUrlAnt,
                child: Text('Mathieu Dhoury'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//code pas beau mais pas possible de mettre l'url quand on appelle la fonction
Future<void> _launchUrlMat() async {
  if (!await launchUrl(Uri.parse('https://www.youtube.com/watch?v=h1VanNumiTg'))) {
    throw Exception('Could not launch https://www.youtube.com/watch?v=dQw4w9WgXcQ');
  }
}

Future<void> _launchUrlAnt() async {
  if (!await launchUrl(Uri.parse('https://www.youtube.com/watch?v=dQw4w9WgXcQ'))) {
    throw Exception('Could not launch https://www.youtube.com/watch?v=dQw4w9WgXcQ');
  }
}
