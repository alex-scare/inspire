import 'package:animations/animations.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:inspire/models/global_state.dart';
import 'package:inspire/screens/goals_screen.dart';
import 'package:inspire/screens/home_screen.dart';
import 'package:inspire/screens/settings.dart';
import 'package:provider/provider.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Randomazer(),
    GoalsScreen(),
    SettingsScreen(),
  ];

  _handleTabSelection(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inspire app',
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
          scheme: Provider.of<GlobalStateModel>(context).currentTheme),
      darkTheme: FlexThemeData.dark(
          scheme: Provider.of<GlobalStateModel>(context).currentTheme),
      themeMode: ThemeMode.system,
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: _handleTabSelection,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.flag), label: 'Goals'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
          body: PageTransitionSwitcher(
              child: _widgetOptions.elementAt(_currentIndex),
              transitionBuilder:
                  (child, primaryAnimation, secondaryAnimation) =>
                      FadeThroughTransition(
                        animation: primaryAnimation,
                        secondaryAnimation: secondaryAnimation,
                        child: child,
                      ))),
    );
  }
}
