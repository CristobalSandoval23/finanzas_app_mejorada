

import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
      bool _darkTheme = false;
      bool _customTheme = false;
      Color colorSeleccionado = Colors.black;
      ThemeData _currentTheme = ThemeData.light();

      bool get darkTheme => _darkTheme;
      bool get customTheme => _customTheme;
      ThemeData get currentTheme => _currentTheme;

      ThemeChanger(int theme){
          switch (theme) {
            case 1: // light
              _customTheme = false;
              _darkTheme = false;
              _currentTheme = ThemeData.light();
              break;
            case 2: // Dark
              _customTheme = false;
              _darkTheme = true;
              _currentTheme = ThemeData.dark();
              break;
            case 3: // Dark
              _customTheme = true;
              _darkTheme = false;
              break;
              
            default:
              _customTheme = false;
              _darkTheme = false;
              _currentTheme = ThemeData.light();

          }
      }

      set darkTheme(bool value){
          _customTheme = false;
          _darkTheme = value;

          if (value) {
            _currentTheme = ThemeData.dark();
          } else {
            _currentTheme = ThemeData.light();            
          }
          notifyListeners();
      }
      set customTheme(bool value){
          _darkTheme = false;
          _customTheme = value;
                    if (value) {            
            _currentTheme = ThemeData.light();            
          } else {
            _currentTheme = ThemeData.light();            
          }
          notifyListeners();
      }

      Color colorElegido(Color color){
        colorSeleccionado = color;
        notifyListeners();
        return colorSeleccionado;
      }

}