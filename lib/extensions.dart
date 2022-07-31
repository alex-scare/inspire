import 'package:flutter/material.dart';

extension ThemeUtils on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => theme.colorScheme;
}
