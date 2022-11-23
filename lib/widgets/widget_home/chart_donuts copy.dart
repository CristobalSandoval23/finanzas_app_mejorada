import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'package:finanzas_personal_2/models/categoria_interna-modal.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../services/egreso_ingreso_service.dart';
import 'package:d_chart/d_chart.dart';

class GraficoDonutsNuevo extends StatelessWidget {
  final List<CategoriaInternaModel> data; 
 GraficoDonutsNuevo({Key? key, required this.data}) : super(key: key);

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {

  final egresoIngresoService = Provider.of<EgresoIngresoService>(context);


    return SizedBox.expand(
      child: FractionallySizedBox(
        widthFactor: 1,
        heightFactor: 0.4,
        child: Column(
          children: <Widget>[
            Expanded(
              child: DChartPie(
                animate: true,
                labelFontSize :15,
                labelLineThickness: 2,
                labelPadding:2, 
                labelPosition: PieLabelPosition.outside,
                data: dataChart(egresoIngresoService.totalGasto, egresoIngresoService.listaGasto),
                fillColor: (listaGastos, index) {                  
                    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
                },
                pieLabel: (listaGastos, index) {                
                  return "${listaGastos['domain']}:\n${listaGastos['measure']}%";
                },
                donutWidth: 50,
              ),    
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, Object>> dataChart(double totalGasto,List<CategoriaInternaModel> datos) {
      final listaGastos =  datos.map((e) {
                              final porcentaje = (e.total*100)/totalGasto;
                              return{"domain":e.nombre,"measure":porcentaje.round()};
                              }).toList();

        return listaGastos;
  }
}