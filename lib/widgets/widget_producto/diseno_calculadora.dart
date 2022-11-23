import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:finanzas_personal_2/models/categoria-modal.dart';
import 'package:finanzas_personal_2/utilidades/iconsList.dart';
import 'package:finanzas_personal_2/widgets/widget_utilidades/messenger_widget.dart';
import 'package:finanzas_personal_2/services/categoria_service.dart';
import 'package:finanzas_personal_2/provider/ingreso_egreso_provider.dart';
import 'package:finanzas_personal_2/services/calculadora_service.dart';
import 'package:finanzas_personal_2/share_preferences/preferencias.dart';
import 'package:finanzas_personal_2/services/egreso_ingreso_service.dart';
import '../../models/ingreso_egreso_bd_model.dart';
import 'botonesNumeros.dart';

class DisenoCalculadoraWidget extends StatelessWidget {
  final Color colorTexto,
              colorFondo;
  final EgresoIngresoService egresoIngresoService;
  final EgresoIngresoFormProvider ingresoEgresoForm;
  final EgresoIngresoBDModel ingresoEgreso;
  const DisenoCalculadoraWidget({Key? key, 
  required this.colorTexto,
  required this.colorFondo,
  required this.egresoIngresoService, 
  required this.ingresoEgresoForm, 
  required this.ingresoEgreso, 
  }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {

      double widtButtom = MediaQuery.of(context).size.width/4-2;
      final calculadoraService = Provider.of<CalculadoraService>(context);
      final categoriaService = Provider.of<CategoriaService>(context);
      final List<CategoriaModal> categoriaList = categoriaService.listaCategoria;
    return Column(children: [
              Row(children: [
                GestureDetector(
               onTap: () => calculadoraService.agregarNumero("1"),
                  child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "1", 
                          fontSize:40,
                          width: widtButtom,),
                ),
                GestureDetector(
               onTap: () => calculadoraService.agregarNumero("2"),             
                  child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "2", 
                          fontSize:40,
                          width: widtButtom,),
                ),
                GestureDetector(
               onTap: () => calculadoraService.agregarNumero("3"),
                  child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "3", 
                          fontSize:40,
                          width: widtButtom,),
                ),
                GestureDetector(
                 onTap: () => calculadoraService.agregarNumero("+"),
                  child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "+", 
                          fontSize:40,
                          width: widtButtom,),
                ),
              ],),
              Row(children: [
                GestureDetector(
               onTap: () => calculadoraService.agregarNumero("4"),
                  child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "4", 
                          fontSize:40,
                          width: widtButtom,),
                ),
                GestureDetector(
               onTap: () => calculadoraService.agregarNumero("5"),
                  child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "5", 
                          fontSize:40,
                          width: widtButtom,),
                ),
                GestureDetector(
               onTap: () => calculadoraService.agregarNumero("6"),
                  child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "6", 
                          fontSize:40,
                          width: widtButtom,),
                ),
                GestureDetector(
                  onTap: () => calculadoraService.agregarNumero("-"),
                  child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "-", 
                          fontSize:40,
                          width: widtButtom,),
                ),
              ],),
              Row(children: [
                GestureDetector(
               onTap: () => calculadoraService.agregarNumero("7"),
                  child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "7", 
                          fontSize:40,
                          width: widtButtom,),
                ),
                GestureDetector(
               onTap: () => calculadoraService.agregarNumero("8"),
                  child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "8", 
                          fontSize:40,
                          width: widtButtom,),
                ),
                GestureDetector(
               onTap: () => calculadoraService.agregarNumero("9"),
                  child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "9", 
                          fontSize:40,
                          width: widtButtom,),
                ),
                GestureDetector(
                  onTap: () => calculadoraService.agregarNumero("x"),
                  child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "x", 
                          fontSize:40,
                          width: widtButtom,),
                ),
              ],),
              Row(children: [
                GestureDetector(
                  onTap: () => calculadoraService.agregarNumero("."),
                  child: GestureDetector(
                    child: BotonIconosWidget(
                            colorTexto: colorTexto, 
                            colorFondo: colorFondo, 
                            texto: ".", 
                            fontSize:40,
                            width: widtButtom,),
                  ),
                ),
                GestureDetector(
               onTap: () => calculadoraService.agregarNumero("0"),
                  child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "0", 
                          fontSize:40,
                          width: widtButtom,),
                ),
                GestureDetector(
                onTap: () => calculadoraService.calcular(),
                  child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "=", 
                          fontSize:40,
                          width: widtButtom,),
                ),
                GestureDetector(
                  onTap: () => calculadoraService.agregarNumero("/"),
                  child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "/", 
                          fontSize:40,
                          width: widtButtom,),
                ),
              ],),
               GestureDetector(
                 onTap: (){

                    // categoriaService
                  if(    Preferences.valorNuevo == "" 
                      || Preferences.valorNuevo == "0"
                      || Preferences.bloquear) {                        
                                messengerWidget(context, "Ingresar valor o terminar de calcular");
                                return;
                              }
                        


                  openModal(context, widtButtom, categoriaList);
                 },
                 child: BotonIconosWidget(
                          colorTexto: colorTexto, 
                          colorFondo: colorFondo, 
                          texto: "ELEGIR CATEGORIA", 
                          fontSize:20,
                          width: MediaQuery.of(context).size.width,),
               )
             ],);


  }

  Future<dynamic> openModal(BuildContext context, double widtButtom, List<CategoriaModal> categoriaList) {
    return showModalBottomSheet(
                  context: context, 
                  builder: (_)=>  GridView.builder(
                              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 10),
                              itemCount: categoriaList.length+1,                              
                              itemBuilder: (BuildContext context, index) {
                                if (categoriaList.length == index) {
                                  return GestureDetector(
                                    onTap: (){
                                       Navigator.popAndPushNamed(context, "categoria");
                                    },
                                    child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(   
                                                borderRadius: BorderRadius.circular(5),                                                                   
                                        ),
                                    child: const Text("Añadir"),
                                  ),
                                  );
                                }
                                return GestureDetector(
                                  onTap: (){
                                    ingresoEgreso.categoria = categoriaList[index].id;
                                    egresoIngresoService.crearOActualizarIngresoEgreso(ingresoEgreso, Preferences.token);
                                    Navigator.pushNamed(context, "home");
                                    messengerWidget(context, "Se creo un ${ingresoEgreso.tipo}");
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(15)),
                                    child:  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(listaIconos[categoriaList[index].icon]?[0]),
                                        Text(categoriaList[index].nombre),
                                        ],
                                    ),
                                    // child: Text(categoriaService.listaCategoria[index].nombre),
                                  ),
                                );
                              }),                  
                  );
  }

}
