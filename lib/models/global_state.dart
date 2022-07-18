import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:enum_to_string/enum_to_string.dart';

const themeLabelMap = <FlexScheme, String>{
  FlexScheme.hippieBlue: 'Hippie',
  FlexScheme.blue: 'Blue',
  FlexScheme.indigo: 'Indigo',
  FlexScheme.deepBlue: 'Deep Blue',
  FlexScheme.outerSpace: 'Outer space',
  FlexScheme.shark: 'Shark',
  FlexScheme.bigStone: 'Stone',
  FlexScheme.greyLaw: 'Grey law',
  FlexScheme.espresso: 'Espresso',
  FlexScheme.rosewood: 'Rosewood',
  FlexScheme.redWine: 'Red wine',
  FlexScheme.red: 'Red',
  FlexScheme.sakura: 'Sakura',
  FlexScheme.damask: 'Damask',
  FlexScheme.mango: 'Mango',
  FlexScheme.amber: 'Amber',
  FlexScheme.green: 'Green',
  FlexScheme.mallardGreen: 'Mallar Green',
  FlexScheme.money: 'Money',
  FlexScheme.jungle: 'Jungle',
};

class GlobalStateModel extends ChangeNotifier {
  FlexScheme _currentTheme = FlexScheme.red;

  GlobalStateModel() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final storedTheme = EnumToString.fromString<FlexScheme>(
        FlexScheme.values, prefs.getString('currentTheme').toString());

    if (storedTheme != null) _currentTheme = storedTheme;
    notifyListeners();
  }

  FlexScheme get currentTheme => _currentTheme;

  Future<void> changeTheme(FlexScheme value) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('currentTheme', EnumToString.convertToString(value));
    _currentTheme = value;
    notifyListeners();
  }
}
