import 'dart:convert';

import 'package:finanzas_personal_2/models/categoria-modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoriaService extends ChangeNotifier {

     final String _baseUrl = "finanzaspersonales2022.herokuapp.com";
    //  final String _baseUrl = "localhost:8088";
     final List<CategoriaModal> listaCategoria = [];
    bool isLoading = true;
     CategoriaService(){
      cargarCategorias();
     }


     Future<String> cargarCategorias()async{
      isLoading = true;
      notifyListeners();

      final url = Uri.http(_baseUrl,"/api/categorias", {"limite":"100"});
      final resp = await http.get(url);
      final Map<String, dynamic> data = json.decode(resp.body);

      data["data"].forEach((element) { 
           
        final tempCategoria = CategoriaModal.fromMap(element);
        
        listaCategoria.add(tempCategoria);
        
      });



      isLoading = false;
      notifyListeners();
        return "";
     }
  
}