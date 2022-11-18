import 'package:flutter/material.dart';

 messengerWidget(BuildContext context, String texto) {

    final snackBar =  SnackBar(
                content: Text(texto),
                action: SnackBarAction(
                  label: texto, 
                  onPressed: (){}),
              );
  return  ScaffoldMessenger.of(context).showSnackBar(snackBar);
    
  }