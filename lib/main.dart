import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:inspire/screens/app_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const AppScreen();
  }
}
