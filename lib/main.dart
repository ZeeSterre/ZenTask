import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zentask/pages/home_page.dart';
import 'package:zentask/pages/quote_page.dart'; // Nieuw toegevoegd

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zen Task',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/quotes': (context) => QuotePage(),
      },
    );
  }
}
