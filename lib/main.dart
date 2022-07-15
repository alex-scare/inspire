import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspire app',
      theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      themeMode: ThemeMode.system,
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random nicknames'),
      ),
      body: const Randomazer(),
    );
  }
}

class Randomazer extends StatefulWidget {
  const Randomazer({Key? key}) : super(key: key);

  @override
  State<Randomazer> createState() => _RandomazerState();
}

class _RandomazerState extends State<Randomazer> {
  final List items = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) {
        if (index.isOdd) {
          return const Divider(
            thickness: 1.0,
          );
        }

        int wordIndex = index ~/ 2;

        if (wordIndex >= items.length) {
          items.addAll(generateWordPairs().take(10));
        }

        return ListTile(
          title: Text(items[wordIndex].asPascalCase),
        );
      }),
    );
  }
}
