import 'package:flutter/material.dart';

import 'package:finanzas_personal_2/share_preferences/preferencias.dart';

class CalculadoraService extends ChangeNotifier {

      List<String> elementosEspeciales = [ "/","x", "+", "-", "."];

     agregarNumero(String numero){
      
      if(numero == "0" && (Preferences.valorNuevo == "" || Preferences.valorNuevo == "0")) return;
      for (var element in elementosEspeciales) {
        if (element == numero)Preferences.bloquear = true;

        if(Preferences.valorNuevo.contains(element) && elementosEspeciales.contains(numero)){
          notifyListeners();
          return;
        }
        
        if((numero == element && (Preferences.valorNuevo == "" || Preferences.valorNuevo == "0$element"))) {          
          Preferences.bloquear = true;
         Preferences.valorNuevo = "0$element";
         return notifyListeners();}    
      }
      
          Preferences.valorNuevo = "${Preferences.valorNuevo}$numero";
          notifyListeners();
    }
     calcular(){      
        Preferences.bloquear = false;
      
        for (var element in elementosEspeciales) {
        final dataString  = Preferences.valorNuevo.split(element);
           if(dataString.last == "")return;
            if(Preferences.valorNuevo.contains(element)){
              switch (element) {
                case "+":
                Preferences.valorNuevo = (int.parse(dataString[0])+int.parse(dataString[1])).toString();
                  break;
                case "-":
                  Preferences.valorNuevo = (int.parse(dataString[0])-int.parse(dataString[1])).toString();                  
                  break;
                case "/":
                  Preferences.valorNuevo = (int.parse(dataString[0])/int.parse(dataString[1])).toString();                  
                  break;
                case "x":
                  Preferences.valorNuevo = (int.parse(dataString[0])*int.parse(dataString[1])).toString();                  
                  break;
                default: return;
              }
            }
      }
          notifyListeners();
    }

     borrarNumero(){

          if(Preferences.valorNuevo == "") return;

          final listString = Preferences.valorNuevo.split('');
          listString.removeLast();
          Preferences.valorNuevo = listString.join();

          notifyListeners();
    }

}

// TODO: Entender el como hacer correctamente el calculo de cada operación a nivel de lógica