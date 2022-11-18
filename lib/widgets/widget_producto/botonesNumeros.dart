import 'package:flutter/material.dart';

class BotonIconosWidget extends StatelessWidget {
  final Color colorTexto, 
              colorFondo;
  final String texto;
  final double fontSize,
               width;
  const BotonIconosWidget({Key? key, 
  required this.colorTexto, 
  required this.colorFondo, 
  required this.texto, 
  required this.fontSize, 
           this.width = 90}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: colorFondo),
            borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.center,
          height: 60,
          width: width,
          child: Text(
            style: TextStyle(
                          color: colorTexto,
                          fontSize: fontSize),
            texto),
        ),
      ),
    );
  }
}