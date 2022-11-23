import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:finanzas_personal_2/models/categoria-modal.dart';
import 'package:finanzas_personal_2/utilidades/fecha.dart';
import 'package:finanzas_personal_2/provider/ingreso_egreso_provider.dart';
import 'package:finanzas_personal_2/share_preferences/preferencias.dart';
import 'package:finanzas_personal_2/theme/theme.dart';
import '../models/ingreso_egreso_bd_model.dart';
// import '../models/ingreso_egreso_model.dart';
import '../services/egreso_ingreso_service.dart';
import 'package:finanzas_personal_2/services/calculadora_service.dart';
import 'package:finanzas_personal_2/widgets/widget_producto/diseno_calculadora.dart';


class PageIngresoEgreso extends StatelessWidget {
  const PageIngresoEgreso({super.key});


  @override

  Widget build(BuildContext context) {
      initializeDateFormatting();
    DateFormat dateFormat = DateFormat('EEEE,  d MMMM', "es");
    String today = dateFormat.format(DateTime.now());
    final appTheme = Provider.of<ThemeChanger>(context);
    final colorPrimary = appTheme.currentTheme.colorScheme.onSecondary;    
    Color colorSecundary = const Color.fromRGBO(121, 200, 145, 10); 
    double widtButtom = MediaQuery.of(context).size.width/4-2;
    Color colorPrimary2 = const Color.fromRGBO(121, 200, 145, 10); 
    Color colorSecundary2 = appTheme.currentTheme.colorScheme.background; 
    final egresoIngresoService = Provider.of<EgresoIngresoService>(context);
    

    return ChangeNotifierProvider(
            create: ( _ ) => EgresoIngresoFormProvider(egresoIngresoService.egresoIngresoSelect),
            child: _EgresoIngresoBody(
              egresoIngresoService: egresoIngresoService,
              colorPrimary: colorPrimary, 
              colorSecundary: colorSecundary, 
              colorSecundary2: colorSecundary2, 
              today: today, colorPrimary2: 
              colorPrimary2, 
              widtButtom: widtButtom));
  }
}

class _EgresoIngresoBody extends StatelessWidget {
  const _EgresoIngresoBody({
    required this.colorPrimary,
    required this.colorSecundary,
    required this.colorSecundary2,
    required this.today,
    required this.colorPrimary2,
    required this.widtButtom,
    required this.egresoIngresoService,
  });

    final Color colorPrimary;
    final Color colorSecundary;
    final Color colorSecundary2;
    final String today;
    final Color colorPrimary2;
    final double widtButtom;
    final EgresoIngresoService egresoIngresoService;

  @override
  Widget build(BuildContext context) {
    final ingresoEgresoForm = Provider.of<EgresoIngresoFormProvider>(context);
    final calculadoraService = Provider.of<CalculadoraService>(context);
    EgresoIngresoBDModel ingresoEgreso = ingresoEgresoForm.ingresoEgreso;
    final TextEditingController controllerEdit = TextEditingController(text: _texto(Preferences.valorNuevo.length));

    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: AppBar(
        title: Text("Nuevo ${Preferences.pagTitle}"),
        backgroundColor: colorSecundary,
        leading:  IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back))
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(children: [
                       Center(
               child: Padding(
                 padding:EdgeInsets.only(
                  top: 10,
                  bottom: MediaQuery.of(context).size.height*0.04),
                 child:  Text(style: TextStyle(color: colorSecundary2),today),
               ),
             ),
             Center(
               child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            color: colorSecundary,
                            borderRadius: BorderRadius.circular(5)),
                          width: MediaQuery.of(context).size.width-50,
                          child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:  [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 3),
                                        child: Column(
                                          children: const [
                                            Icon(size:39,color:Colors.white,Icons.money),
                                            Text(style: TextStyle(color: Colors.white),"CLP"),
                                          ],
                                        ),
                                      ),                                        
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width/2,
                                        child: TextFormField(                                            
                                            controller: controllerEdit,                                            
                                            textAlign: TextAlign.center,                
                                            style: const TextStyle(fontSize: 40, color: Colors.white),
                                            decoration:  InputDecoration(
                                                                fillColor: colorSecundary,
                                                                filled: true, 
                                                                enabled: false,                                                                                                              
                                                            ),               
                                          ),
                                      ),
                                      GestureDetector(
                                        onTap: () => calculadoraService.borrarNumero(),
                                        child: const Icon(size:40,color:Colors.white,Icons.arrow_back)),
                                    ],
                                 ),
                       ),
             ),
             Padding(
               padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
               child: TextFormField(
                initialValue: ingresoEgreso.descripcion,
                onChanged: (value) => ingresoEgreso.descripcion = value,
                decoration:  InputDecoration(
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: colorSecundary),
                                    ),
                                    floatingLabelStyle: TextStyle(color: colorSecundary),
                                    filled: true,
                                    labelText: "Nota",                                                     
                                    labelStyle: const TextStyle(color: Colors.grey),
                                    prefixIcon: const Icon(Icons.abc),
                                    prefixIconColor: colorSecundary),               
               ),
             ),
            ],), 
            SizedBox(height: MediaQuery.of(context).size.height*0.15),
            DisenoCalculadoraWidget(
              colorTexto: colorPrimary2, 
              colorFondo: colorSecundary2, 
              egresoIngresoService: egresoIngresoService, 
              ingresoEgresoForm: ingresoEgresoForm,
              ingresoEgreso: EgresoIngresoBDModel(
                descripcion: ingresoEgreso.descripcion, 
                tipo: Preferences.pagTitle.toUpperCase(), 
                uid: '', 
                fecha: formatoFechaModificado(DateTime.now().toString()), 
                categoria: "6376deedb82b1849e68a43eb", 
                valor: (controllerEdit.text.contains(RegExp("[x + -- /]")))?0:int.parse(controllerEdit.text)))          
          ],),
      ),);
  }
}

String _texto(int valor) {

  final String text;

  if (valor == 0) {
    text = "0";
  }else{
    
    text =  Preferences.valorNuevo;
  }
  return text;
}

