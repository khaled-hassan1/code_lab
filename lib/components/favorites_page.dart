import 'package:code_lab/components/provider_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: const Center(
          child: Text(
            'No Favorites Yet',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
                fontSize: 20),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'You have '),
                  TextSpan(
                    text: '${appState.favorites.length}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: ' favorites.'),
                ],
              ),
            ),
          ),
          for (var pair in appState.favorites)
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.red),
              title: Text(pair.asCamelCase),
              trailing: IconButton(
                  onPressed: () {
                    appState.getDelete(pair);
                  },
                  icon: const Icon(Icons.delete)),
            ),
        ],
      ),
      // floatingActionButton: ElevatedButton(
      //   onPressed: () {
      //     // appState.getLastElement(appState.current);
      //   },
      //   child: const Padding(
      //     padding: EdgeInsets.all(10),
      //     child: Text(
      //       'Return deleted',
      //       style: TextStyle(
      //         fontSize: 20,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
