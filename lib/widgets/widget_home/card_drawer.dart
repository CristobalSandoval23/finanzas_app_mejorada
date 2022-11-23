import 'package:finanzas_personal_2/services/egreso_ingreso_service.dart';
import 'package:finanzas_personal_2/share_preferences/preferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardDrawerWidget extends StatelessWidget {
  final String titulo;
  final Color color;
  final String fechaSeleccionada;
  const CardDrawerWidget({Key? key, 
              required this.titulo, 
              required this.color, 
              required this.fechaSeleccionada, 
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ingresoEgresoService = Provider.of<EgresoIngresoService>(context);
    return GestureDetector(
      onTap: () {
        Preferences.fechaSeleccionada = fechaSeleccionada;
        
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width /2,
        height: 50,
        decoration: BoxDecoration(        
          border: Border.all(width: 2.0,color: color,)),
        child:  Text(titulo),
        ),
    );
  }
}