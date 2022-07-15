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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<WordPair> items = List.empty(growable: true);

  void _incrementCounter() {
    setState(() {
      items.setAll(0, List.generate(100, (index) => WordPair.random()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: ((context, index) {
          if (index.isOdd) {
            return const Divider(
              thickness: 1.0,
            );
          }

          final item = items[index];
          return ListTile(
            title: Text(item.asPascalCase),
          );
        }),
      ),
      // Column(\]
      //   // Column is also a layout widget. It takes a list of children and
      //   // arranges them vertically. By default, it sizes itself to fit its
      //   // children horizontally, and tries to be as tall as its parent.
      //   //
      //   // Invoke "debug painting" (press "p" in the console, choose the
      //   // "Toggle Debug Paint" action from the Flutter Inspector in Android
      //   // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      //   // to see the wireframe for each widget.
      //   //
      //   // Column has various properties to control how it sizes itself and
      //   // how it positions its children. Here we use mainAxisAlignment to
      //   // center the children vertically; the main axis here is the vertical
      //   // axis because Columns are vertical (the cross axis would be
      //   // horizontal).
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     const Text(
      //       'You have clicked the button this many times:',
      //     ),
      //     Text(
      //       '$_counter',
      //       style: Theme.of(context).textTheme.headline4,
      //     ),
      //     Text('$_counter', style: Theme.of(context).textTheme.bodyText2)
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.apple),
      ),
    );
  }
}
