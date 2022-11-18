import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:o_color_picker/o_color_picker.dart';

import 'package:finanzas_personal_2/theme/theme.dart';

class CategoriaPage extends StatefulWidget {
  
  @override
  State<CategoriaPage> createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
         final Map<double, List> listaIconos = {
        1:[Icons.ac_unit_rounded],
        2:[Icons.search],
        3:[Icons.abc_sharp],
        4:[Icons.ac_unit_rounded],
        5:[Icons.mobile_screen_share_rounded],
        6:[Icons.account_balance_wallet_sharp],
        7:[Icons.account_balance_wallet_outlined],
        8:[Icons.zoom_out_map_outlined],
        9:[Icons.youtube_searched_for_sharp],
        10:[Icons.face],
        11:[Icons.dangerous],
        12:[Icons.e_mobiledata],
        13:[Icons.e_mobiledata],
        14:[Icons.woo_commerce_rounded],
        };

    int indice =0;
  @override
  Widget build(BuildContext context) {
     double widtButtom = MediaQuery.of(context).size.width/4-2;
    initializeDateFormatting();
     final appTheme = Provider.of<ThemeChanger>(context);
     final colorPrimary = appTheme.currentTheme.colorScheme.onSecondary;
     const colorSecundary = Color.fromRGBO(121, 200, 145, 10);

    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: AppBar(
        backgroundColor: colorSecundary,
        title:const  Text("Crear Categoría"),
        leading:  IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back))
        ),
      body: Column(
              children: [
                 Padding(
               padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.05,
                bottom: MediaQuery.of(context).size.height*0.05),
               child: TextFormField(
                decoration:  const InputDecoration(
                                    enabledBorder:  UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: colorSecundary),
                                    ),
                                    floatingLabelStyle: TextStyle(color: colorSecundary),
                                    filled: true,
                                    labelText: "Nombre de la categoría",                           
                                    labelStyle:  TextStyle(color: Colors.grey),
                                    prefixIcon:  Icon(Icons.abc),
                                    prefixIconColor: colorSecundary),
             
               ),
             ),
             Padding(
               padding: const EdgeInsets.only(bottom: 20),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(appTheme.colorSeleccionado)
                            ),
                          onPressed: (){
                            showModalBottomSheet(context: context, builder: (_)=> Material(
                              child: OColorPicker(
                                selectedColor: appTheme.colorSeleccionado, 
                                onColorChange: (color){
                                    appTheme.colorElegido(color);
                                    Navigator.of(context).pop();
                                }),
                              )
                            );
                           }, 
                          child: const Text("Seleccionar color")),
                          // child: Icon(Icons)),
               ],
               ),
             ),
             Expanded(child: gridView(context,listaIconos, appTheme.colorSeleccionado, colorPrimary))
              ]),
        );
  }

GridView gridView(BuildContext context, Map listaIconos, Color color, Color colorPrimary) {
  final appTheme = Provider.of<ThemeChanger>(context);
  // late int indice;

    return  GridView.builder(
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 150,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                              itemCount: listaIconos.length,                              
                              itemBuilder: (BuildContext context, index) {
                                
                                return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      indice = index;
                                      
                                    });
                                      
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration:  BoxDecoration(
                                      color: (indice == index)? Colors.blueGrey: colorPrimary,                                      
                                      border: const Border(
                                        bottom: BorderSide(color: Colors.grey),
                                        left: BorderSide(color: Colors.grey),
                                        ),),
                                    child:Icon(
                                      listaIconos[index+1][0],
                                      color: color,
                                      size: 40,),
                            
                                  ),
                                );
                              }
                              );                
                  
  }
}