import 'dart:convert';
import 'package:finanzas_personal_2/models/categoria-modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:finanzas_personal_2/models/categoria_interna-modal.dart';
import 'package:finanzas_personal_2/models/ingreso_egreso_bd_model.dart';

class EgresoIngresoService extends ChangeNotifier {

     final String _baseUrl = "finanzaspersonales2022.herokuapp.com";
    //  final String _baseUrl = "localhost:8088";
    final  List<CategoriaInternaModel> listaCategoriaModificada = [];
    final  List<CategoriaInternaModel> listaIngreso = [];
   final   List<CategoriaInternaModel> listaGasto = [];
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
      final url = Uri.http(_baseUrl,"/api/ingresos", {"limite":"400"});
      final resp = await http.get(url);
      final Map<String, dynamic> data = json.decode(resp.body);

      print("Entre");

      for (var tipo in tipoLista) {

             final categoriaDisponible = await data["data"].where((ingresoEgreso) 
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
                
              final CategoriaInternaModel temp =  CategoriaInternaModel(
                id: categoria, 
                total: total,
                nombre: listaEgresoIngresoCategoria[0]["categoria"]["nombre"], 
                tipo: tipo, 
                datos: listaEgresoIngresoCategoria); 

                if (tipo == "INGRESO") {
                  
                listaIngreso.add(temp);
                }else{
                listaGasto.add(temp);

                }

              });

      }
              listaIngreso.sort((a,b)=> a.total.compareTo(b.total));
              listaGasto.sort((a,b)=> a.total.compareTo(b.total));

              listaCategoriaModificada.addAll(listaIngreso.reversed.toList(),);
              listaCategoriaModificada.addAll(listaGasto.reversed.toList());

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

        listaCategoriaModificada.clear();
        listaGasto.clear();
        listaIngreso.clear();
        cargar();

        return "";
     }
  
}