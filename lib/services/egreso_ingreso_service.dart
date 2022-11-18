import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:finanzas_personal_2/models/categoria_interna-modal.dart';
import 'package:finanzas_personal_2/models/ingreso_egreso_bd_model.dart';

import 'package:finanzas_personal_2/models/ingreso_egreso_model.dart';

class EgresoIngresoService extends ChangeNotifier {

     final String _baseUrl = "finanzaspersonales2022.herokuapp.com";
    //  final String _baseUrl = "localhost:8088";
     final List<EgresoIngresoModel> egresoIngresoList = [];
     final List listaCategoria = [];
     final List categoriaList = [];
     final List<CategoriaInternaModel> listaCategoriaModificada = [];
     final List pruebaLista = [];
      double totalIngreso = 0,
             totalGasto   = 0;
     late EgresoIngresoBDModel egresoIngresoSelect;
     bool isLoading = true;

     EgresoIngresoService(){
      cargar();
     }


     Future<List<CategoriaInternaModel>> cargar()async{
      
      isLoading = true;
      notifyListeners();
      final List<String> tipoLista = ["INGRESO","GASTO"];
      final url = Uri.http(_baseUrl,"/api/ingresos", {"limite":"40"});
      final resp = await http.get(url);
      final Map<String, dynamic> data = json.decode(resp.body);

      print(data["data"][0]);

      for (var tipo in tipoLista) {

             final categoriaDisponible = data["data"].where((ingresoEgreso) 
                                      => ingresoEgreso["fecha"].contains("2022")
                                         && ingresoEgreso["tipo"] == tipo)
                                      .map((egresoIngreso) => egresoIngreso["categoria"]["_id"])
                                      .toSet().toList();


              categoriaDisponible.forEach((categoria) {
                  final listaEgresoIngresoCategoria = data["data"].where((ingresoEgreso) 
                                                          => ingresoEgreso["fecha"].contains("2022")
                                                          && ingresoEgreso["tipo"] == tipo
                                                          && ingresoEgreso["categoria"]["_id"] == categoria)
                                                          .map((ingresoEgresoSeleccionado) => ingresoEgresoSeleccionado)
                                                          .toList();

              final double total = listaEgresoIngresoCategoria.map((ingresoEgreso) => ingresoEgreso["valor"])
                                                      .fold(0.0, (a, b) => a+b);
                                                      

              if (tipo == "INGRESO") {
              totalIngreso += total;                                   
              } else {

              totalGasto += total;                                   
              }
                
              final CategoriaInternaModel temp = CategoriaInternaModel(
                id: categoria, 
                total: total,
                nombre: listaEgresoIngresoCategoria[0]["categoria"]["nombre"], 
                tipo: listaEgresoIngresoCategoria[0]["tipo"], 
                datos: listaEgresoIngresoCategoria); 

                listaCategoriaModificada.add(temp);
              });

      }

        isLoading = false;
        notifyListeners();

        return listaCategoriaModificada;
     }

     crearOActualizarIngresoEgreso(EgresoIngresoBDModel egresoIngreso,String token){
            isLoading = true;
            notifyListeners();
            if (egresoIngreso.uid == "") {
                crearIngresoEgreso(egresoIngreso, token);
            } else {
              
            }

                  isLoading = false;
      notifyListeners();
    
     }

     Future<String> crearIngresoEgreso(EgresoIngresoBDModel egresoIngreso, String token)async{

        final url = Uri.http(_baseUrl,"/api/ingresos");
        final resp = await http.post(url, headers: {
          "Content-Type":"application/json",
          "x-token":token
        },
        body: egresoIngreso.toJson() 
        );
        return "";
     }
  
}