import 'package:flutter/material.dart';

class IngresosEgresosWidget extends StatelessWidget {

  final String ingreso;
  final String egreso;
  const IngresosEgresosWidget({Key? key, 
  required this.ingreso, 
  required this.egreso}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
                   child: FractionallySizedBox(
                    alignment: Alignment.center,
                    widthFactor: 0.18,
                    heightFactor: 0.1,
                      child: ListTile(
                        title: Text(ingreso),
                        subtitle: Text(egreso))),
                 );
  }
}