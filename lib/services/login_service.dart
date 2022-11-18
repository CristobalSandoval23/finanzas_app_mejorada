import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:finanzas_personal_2/share_preferences/preferencias.dart';

class LoginService extends ChangeNotifier {

     final String _baseUrl = "finanzaspersonales2022.herokuapp.com";

     LoginService(){
      login();
     }

  Future<String> login() async{
    final url = Uri.https(_baseUrl, "/api/auth/login");
    final usuario = {
      "correo":"bruno@gmail.com",
      "password":"12345678"
    };

    
    final resp = await http.post(url, headers: {
                            'Content-Type': 'application/json',
                          },body: jsonEncode(usuario));
    final data = await json.decode(resp.body);

    final token = data["token"];
    Preferences.token = token;


    return token;
  }

  
}