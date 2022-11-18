import 'package:finanzas_personal_2/models/categoria_interna-modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/gestures.dart';
import 'package:finanzas_personal_2/services/egreso_ingreso_service.dart';
import 'package:finanzas_personal_2/share_preferences/preferencias.dart';

class BottonModal extends StatelessWidget {

  final List<CategoriaInternaModel> datos;
  final String saldo;
  final Color colorPrimary,colorSecundary;

  const BottonModal({
    super.key, 
    required this.datos, 
    required this.saldo, 
    required this.colorSecundary, 
    required this.colorPrimary});

  @override
  Widget build(BuildContext context) {

    return DraggableScrollableSheet(
      snap:true,
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 1,
        builder: (context, scrollController){
          return NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification)  {
              return true;
              }
            ,
            child: Scrollbar(
              controller: scrollController,
              child: Container(
                color: colorPrimary,
                child: Column(
                  children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                        IconButton(
                                          iconSize: 20,
                                            icon:  Icon(Icons.menu, color: colorSecundary,),
                                            tooltip: 'Show Snackbar',
                                            onPressed: () {}
                                        ),
                                        Container(
                                            alignment: Alignment.center,
                                            decoration:  BoxDecoration(
                                              color: colorSecundary,
                                          
                                              ),
                                      
                                            width: 200,
                                            height: 45,
                                            child: Text("Saldo CLP $saldo" )
                                        ),
                                        IconButton(
                                            iconSize: 20,
                                            icon:  Icon(Icons.menu, color: colorSecundary,),
                                            tooltip: 'Show Snackbar',
                                            onPressed: () {}                        
                                        ),
                            ],),        
                 Expanded(
                   child: ListView.builder(
                    dragStartBehavior: DragStartBehavior.down,
                      controller: scrollController,
                      shrinkWrap:true,
                      itemCount: datos.length,
                      itemBuilder: (context, indexx) =>  ExpansionTile(
                        title: GestureDetector(
                          onTap: () {},
                          child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [ 
                                    Row(children: [
                                            Icon(Icons.search),
                                            Text(datos[indexx].nombre),

                                    ],),
                                            Text("CLP ${datos[indexx].total.toString()}"),
                                  
                                      ],),
                        ),
                        children:  List.generate(datos[indexx].datos.length, (index) =>                         
                            GestureDetector(
                              onTap: () {
                                
                                Preferences.pagTitle = "Editar gasto";
                                // Navigator.pushNamed(context, "nuevo")
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10,bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                      Text("CLP ${datos[indexx].datos[index]["valor"].toString()}"),
                                      Text(datos[indexx].datos[index]["fecha"]),
                                  ],
                                ),
                              ),
                            ),)
                          ,
                        
                      )),
                 ), 
                    
                          
                ],),
              )
              ),
          );
    
        }) ;
  }
}