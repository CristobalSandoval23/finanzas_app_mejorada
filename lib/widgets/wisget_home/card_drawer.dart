import 'package:flutter/material.dart';

class CardDrawerWidget extends StatelessWidget {
  final String titulo;
  final Color color;
  const CardDrawerWidget({Key? key, 
              required this.titulo, 
              required this.color, 
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width /2,
      height: 50,
      decoration: BoxDecoration(        
        border: Border.all(width: 2.0,color: color,)),
      child:  Text(titulo),
      );
  }
}