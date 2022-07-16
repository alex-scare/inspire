import 'package:flutter/material.dart';
import 'package:inspire/utils/navigation.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:enum_to_string/enum_to_string.dart';

enum ThemeNameEnum { red, green, blue, mango }

const themeMap = <ThemeNameEnum, String>{
  ThemeNameEnum.blue: 'Blue',
  ThemeNameEnum.green: 'Green',
  ThemeNameEnum.red: 'Red',
  ThemeNameEnum.mango: 'Mango',
};

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemeNameEnum _currentTheme = ThemeNameEnum.blue;

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
        _currentTheme = storedTheme;
      });
    }
  }

  Future<void> _changeTheme(ThemeNameEnum value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('currentTheme', EnumToString.convertToString(value));
      _currentTheme = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: SettingsList(sections: [
          SettingsSection(
            tiles: [
              SettingsTile.navigation(
                leading: const Icon(Icons.format_paint),
                title: const Text('Theme'),
                onPressed: (context) async {
                  final selected = await Navigation.navigateTo<ThemeNameEnum>(
                    context: context,
                    style: NavigationRouteStyle.material,
                    screen: ThemePickerScreen(
                      theme: _currentTheme,
                      options: themeMap,
                    ),
                  );

                  if (selected != null) {
                    _changeTheme(selected);
                  }
                },
                value: Text(themeMap[_currentTheme].toString()),
              ),
            ],
          )
        ]));
  }
}

class ThemePickerScreen extends StatelessWidget {
  const ThemePickerScreen({
    Key? key,
    required this.theme,
    required this.options,
  }) : super(key: key);

  final ThemeNameEnum theme;
  final Map<ThemeNameEnum, String> options;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Select the theme you want'),
            tiles: options.keys.map((e) {
              final option = options[e];

              return SettingsTile(
                title: Text(option.toString()),
                onPressed: (_) {
                  Navigator.of(context).pop(e);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
