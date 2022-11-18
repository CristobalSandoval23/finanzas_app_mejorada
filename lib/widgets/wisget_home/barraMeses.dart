import 'package:flutter/material.dart';

class BarraMesesWidget extends StatelessWidget {

  final String mesAnterior;
  final String mesactual;
  final String mesSiguiente;
  const BarraMesesWidget({Key? key, 
            required this.mesAnterior, 
            required this.mesactual, 
            required this.mesSiguiente}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [                    
                    Text(mesAnterior),  
                    Text(mesactual),  
                    Text(mesSiguiente),                      
                  ],
                ),
              );
  }
}