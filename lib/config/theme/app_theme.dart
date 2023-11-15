import 'package:flutter/material.dart';

Color _colorPrimary = const Color(0xFF00BCD4);

List<Color> _colorTheme = [
  _colorPrimary,
  Colors.brown,
  Colors.purple,
  Colors.green,
  Colors.orange,
  Colors.teal,
  Colors.pink,
  Colors.blue,
  Colors.red,
  Colors.indigo,
  Colors.amber,
  Colors.deepPurple,
  Colors.lightBlue,
  Colors.lime,
  Colors.deepOrange,
  Colors.cyan,
  Colors.yellow,
  Colors.grey,
  Colors.blueGrey,
  Colors.black,
];

class AppTheme {
  int selectedColor;
  Brightness brightness;
  AppTheme({
    this.selectedColor = 0,
    this.brightness = Brightness.light,
  });
  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorTheme[selectedColor],
        brightness: brightness);
  }
}
