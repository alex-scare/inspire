import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Randomazer extends StatefulWidget {
  const Randomazer({Key? key}) : super(key: key);

  @override
  State<Randomazer> createState() => _RandomazerState();
}

class _RandomazerState extends State<Randomazer> {
  final List _items = <WordPair>[];
  final _favourite = <WordPair>{};

  void _goToFavourites() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _favourite.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Favourites'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Random nicknames'),
          actions: [
            IconButton(
              icon: Icon(Icons.list, color: Theme.of(context).primaryColor),
              onPressed: _goToFavourites,
              tooltip: 'Favourites',
            ),
          ],
        ),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            if (index.isOdd) {
              return const Divider(
                thickness: 1.0,
              );
            }

            int wordIndex = index ~/ 2;

            if (wordIndex >= _items.length) {
              _items.addAll(generateWordPairs().take(10));
            }

            final current = _items[wordIndex];

            final isFavourite = _favourite.contains(current);

            return ListTile(
                title: Text(current.asPascalCase),
                trailing: Icon(
                  isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: isFavourite ? Colors.red : null,
                  semanticLabel: isFavourite
                      ? 'Remove from favorite list'
                      : 'Add to favorite list',
                ),
                onTap: () {
                  setState(() {
                    isFavourite
                        ? _favourite.remove(current)
                        : _favourite.add(current);
                  });
                });
          }),
        ));
  }
}
