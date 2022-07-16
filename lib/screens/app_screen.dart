import 'package:animations/animations.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:inspire/screens/home_screen.dart';
import 'package:inspire/screens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

const themeColorSchemeMap = <ThemeNameEnum, FlexScheme>{
  ThemeNameEnum.blue: FlexScheme.blue,
  ThemeNameEnum.green: FlexScheme.green,
  ThemeNameEnum.red: FlexScheme.red,
  ThemeNameEnum.mango: FlexScheme.mango,
};

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen>
    with SingleTickerProviderStateMixin {
  FlexScheme _currentScheme = FlexScheme.blue;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final storedTheme = EnumToString.fromString<ThemeNameEnum>(
        ThemeNameEnum.values, prefs.getString('currentTheme').toString());
    if (storedTheme != null) {
      setState(() {
        _currentScheme = themeColorSchemeMap[storedTheme] ?? FlexScheme.blue;
      });
    }
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Randomazer(),
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
      theme: FlexThemeData.light(scheme: _currentScheme),
      darkTheme: FlexThemeData.dark(scheme: _currentScheme),
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
