import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:enum_to_string/enum_to_string.dart';

const themeLabelMap = <FlexScheme, String>{
  FlexScheme.blue: 'Blue',
  FlexScheme.green: 'Green',
  FlexScheme.red: 'Red',
  FlexScheme.mango: 'Mango',
  FlexScheme.deepBlue: 'Deep blue',
  FlexScheme.gold: 'Gold',
  FlexScheme.redWine: 'Red wine',
  FlexScheme.rosewood: 'Rosewood',
  FlexScheme.sakura: 'Sakura',
  FlexScheme.vesuviusBurn: 'Burn'
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
  }

  FlexScheme get currentTheme => _currentTheme;

  Future<void> changeTheme(FlexScheme value) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('currentTheme', EnumToString.convertToString(value));
    _currentTheme = value;
    notifyListeners();
  }
}
