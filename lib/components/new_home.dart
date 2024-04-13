import 'package:code_lab/components/favorites_page.dart';
import 'package:flutter/material.dart';

import '../calc/calc_age.dart';
import 'generatorPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        page = const FavoritesPage();
        break;
      case 2:
      page = const CalcAge(); 
      break; 
      default:
        throw UnimplementedError('No widget for $selectedIndex');
    }
    var colorScheme = Theme.of(context).colorScheme;
    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: page,
      ),
    );
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        label: 'Favorites',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.calculate,
                          color: Colors.green,
                        ),
                        label: 'Favorites',
                      ),
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                )
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(
                          Icons.home,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        label: Text('Favorites'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(
                          Icons.calculate,
                          color: Colors.green,
                        ),
                        label: Text('Calculator Age'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}
