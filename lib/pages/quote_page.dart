import 'package:flutter/material.dart';
import 'dart:math';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  // Lijst van quotes met bijbehorende afbeeldingen
  final List<Map<String, String>> quotesWithImages = [
    {
      "quote": "The mind is everything. What you think you become.",
      "image": "assets/images/quote1.jpg",
    },
    {
      "quote":
          "Life isn’t about finding yourself. It’s about creating yourself.",
      "image": "assets/images/quote2.jpg",
    },
    {
      "quote":
          "Do not dwell in the past, do not dream of the future, concentrate the mind on the present moment.",
      "image": "assets/images/quote3.jpg",
    },
    {
      "quote": "Don’t let the behavior of others destroy your inner peace.",
      "image": "assets/images/quote4.jpg",
    },
    {
      "quote": "Your past mistakes are meant to guide you, not define you.",
      "image": "assets/images/quote5.jpg",
    },
    {
      "quote": "Small steps every day lead to big results.",
      "image": "assets/images/quote6.jpg",
    },
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _generateRandomQuote();
  }

  void _generateRandomQuote() {
    final random = Random();
    setState(() {
      currentIndex = random.nextInt(quotesWithImages.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuote = quotesWithImages[currentIndex]['quote']!;
    final currentImage = quotesWithImages[currentIndex]['image']!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Quote'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 240, 237, 229),
        foregroundColor: Color.fromARGB(255, 110, 104, 104),
      ),
      body: Stack(
        children: [
          // Achtergrondafbeelding
          Positioned.fill(child: Image.asset(currentImage, fit: BoxFit.cover)),
          // Inhoud bovenop de achtergrond
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Quote tekst
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '"$currentQuote"',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 110, 104, 104),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _generateRandomQuote,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 249, 248, 243),
                    ),
                    child: const Text(
                      'Get Another Quote',
                      style: TextStyle(
                        color: Color.fromARGB(255, 110, 104, 104),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
