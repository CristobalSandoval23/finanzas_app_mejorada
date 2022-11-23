import 'package:shared_preferences/shared_preferences.dart';

import '../utilidades/fecha.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _pagTitle = "" ;
  static String _valorNuevo = "" ;
  static String _token = "" ;
  static bool _bloquear = false ;
  static String _fechaSeleccionada = formatoFechaModificado(DateTime.now().toString()) ;

  static Future init() async{
    _prefs = await SharedPreferences.getInstance();
  }

  static String get pagTitle {
    return _prefs.getString("pagTitle") ?? _pagTitle;
  }

  static set pagTitle(String pagTitle) {
    _pagTitle = pagTitle;
    _prefs.setString("pagTitle", pagTitle);
  }
  static String get valorNuevo {
    return _prefs.getString("valorNuevo") ?? _valorNuevo;
  }

  static set valorNuevo(String valorNuevo) {
    _valorNuevo = valorNuevo;
    _prefs.setString("valorNuevo", valorNuevo);
  }
  static String get token {
    return _prefs.getString("token") ?? _token;
  }

  static set token(String token) {
    _token = token;
    _prefs.setString("token", token);
  }
  static bool get bloquear {
    return _prefs.getBool("bloquear") ?? _bloquear;
  }

  static set bloquear(bool bloquear) {
    _bloquear = bloquear;
    _prefs.setBool("bloquear", bloquear);
  }
  static String get fechaSeleccionada {
    return _prefs.getString("fechaSeleccionada") ?? _fechaSeleccionada;
  }

  static set fechaSeleccionada(String fechaSeleccionada) {
    _fechaSeleccionada = fechaSeleccionada;
    _prefs.setString("fechaSeleccionada", fechaSeleccionada);
  }

}