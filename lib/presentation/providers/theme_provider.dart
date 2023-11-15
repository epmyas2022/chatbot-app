import 'dart:math';

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  int _selectedColor = 5;

  int get selectedColor => _selectedColor;

  void changeColor(int value) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Cambiar el tema después de que el frame actual se haya construido
      _selectedColor = value;
      notifyListeners();
    });
  }

  void changeColorRandom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _selectedColor = Random().nextInt(14);

      notifyListeners();
    });
  }

  bool _brightness = true;

  get brightness => _brightness;

  void changeBrightness(bool value) {
    _brightness = value;
    notifyListeners();
  }
}
