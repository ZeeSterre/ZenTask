import 'package:flutter/material.dart';

class Recipes extends StatelessWidget {
  const Recipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
        backgroundColor: Color.fromARGB(255, 240, 237, 229),
        foregroundColor: Color.fromARGB(255, 110, 104, 104),
      ),
      body: Container(
        color: const Color.fromARGB(255, 213, 210, 199),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to the Recipes page!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            const Text(
              'Here you can browse through various recipes.',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            // inhoud
          ],
        ),
      ),
    );
  }
}
