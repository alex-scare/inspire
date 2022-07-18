import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:inspire/models/global_state.dart';
import 'package:inspire/utils/navigation.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalStateModel>(context);

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
                  final selected = await Navigation.navigateTo<FlexScheme>(
                    context: context,
                    style: NavigationRouteStyle.material,
                    screen: ThemePickerScreen(
                      theme: globalState.currentTheme,
                      options: themeLabelMap,
                    ),
                  );

                  if (selected != null) globalState.changeTheme(selected);
                },
                value: Text(themeLabelMap[globalState.currentTheme].toString()),
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

  final FlexScheme theme;
  final Map<FlexScheme, String> options;

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Select the theme you want'),
            tiles: options.keys.map((key) {
              final option = options[key];

              final darkColor = FlexThemeData.dark(scheme: key).primaryColor;
              final lightColor = FlexThemeData.light(scheme: key).primaryColor;

              return SettingsTile(
                  title: Text(option.toString()),
                  onPressed: (_) {
                    Navigator.of(context).pop(key);
                  },
                  trailing: theme == key
                      ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                      : const Icon(null),
                  leading: Icon(Icons.circle_rounded,
                      color: isDark ? darkColor : lightColor));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
