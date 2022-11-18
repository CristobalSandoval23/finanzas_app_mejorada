import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'package:finanzas_personal_2/models/categoria_interna-modal.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../services/egreso_ingreso_service.dart';


class GraficoDonuts extends StatelessWidget {
  final List<CategoriaInternaModel> data; 
 GraficoDonuts({Key? key, required this.data}) : super(key: key);

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
  final egresoIngresoService = Provider.of<EgresoIngresoService>(context);

    return SizedBox.expand(
      child: FractionallySizedBox(
        widthFactor: 0.6,
        heightFactor: 0.4,
        child: Column(
          children: <Widget>[
            Expanded(
              child: PieChart(
                PieChartData(
                    pieTouchData: PieTouchData(touchCallback:
                        (FlTouchEvent event, pieTouchResponse) {
                      // setState(() {
                      //   if (!event.isInterestedForInteractions ||
                      //       pieTouchResponse == null ||
                      //       pieTouchResponse.touchedSection == null) {
                      //     touchedIndex = -1;
                      //     return;
                      //   }
                      //   touchedIndex = pieTouchResponse
                      //       .touchedSection!.touchedSectionIndex;
                      // });
                    }),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 60,
                    sections: showingSections(egresoIngresoService.totalGasto)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(double totalGasto) {
    

   final listaGastos = data.where((element) => element.tipo == "GASTO")
                            .map((e) => e).toList();
    
    return List.generate(listaGastos.length, (i) {
      
        final double porcentaje = (100 * listaGastos[i].total)/totalGasto;

      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;

       return PieChartSectionData(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
            value: listaGastos[i].total,
            title: "${porcentaje.round().toString()} %",
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
      
    });
  }
}