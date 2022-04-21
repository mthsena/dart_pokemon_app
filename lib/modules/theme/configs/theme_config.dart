import 'package:flutter/material.dart';

class ThemeConfig {
  const ThemeConfig._();

  static const backgroundColor = 0xffffffff;

  static const brightness = Brightness.light;

  static final theme = ThemeData(
    brightness: brightness,
  );
}
