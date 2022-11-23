import 'package:finanzas_personal_2/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../models/ingreso_egreso_bd_model.dart';
import '../services/categoria_service.dart';
import '../services/egreso_ingreso_service.dart';
import 'package:finanzas_personal_2/models/categoria-modal.dart';
import 'package:finanzas_personal_2/services/login_service.dart';
import 'package:finanzas_personal_2/widgets/widget_home/barraMeses.dart';
import 'package:finanzas_personal_2/widgets/widget_home/botonModal.dart';
import 'package:finanzas_personal_2/widgets/widget_home/card_drawer.dart';
import 'package:finanzas_personal_2/widgets/widget_home/ingresos-egresos_widget.dart';
import 'package:finanzas_personal_2/widgets/widget_home/card_end_drawer_widget.dart';
import 'package:finanzas_personal_2/theme/theme.dart';
import 'package:finanzas_personal_2/share_preferences/preferencias.dart';

import '../widgets/widget_home/chart_donuts copy.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    initializeDateFormatting();
    final appTheme = Provider.of<ThemeChanger>(context);
    final colorPrimary = appTheme.currentTheme.colorScheme.onSecondary;
    const colorSecundary =Color.fromRGBO(121, 200, 145, 10);
    print(Preferences.fechaSeleccionada);
            final egresoIngresoService = Provider.of<EgresoIngresoService>(context);
            final categoriaService = Provider.of<CategoriaService>(context);
            final loginService = Provider.of<LoginService>(context);            
            final List<CategoriaModal> categoriasLista = categoriaService.listaCategoria;
            if (egresoIngresoService.isLoading || categoriaService.isLoading) const Loading();   

    return Scaffold(
      backgroundColor: colorPrimary,
      endDrawer: Padding(
        padding: EdgeInsets.only(top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top),
        child: Container(
          width: MediaQuery.of(context).size.width/2 +20,
          color: colorPrimary,
          child: SizedBox.expand(
            child: FractionallySizedBox(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  GestureDetector(
                    onTap: ()=> Navigator.pushNamed(context, "categoria"),
                    child: CardEndDrawerWidget(titulo: 'Categoria', icon: Icons.category,color: colorSecundary,)),
                  CardEndDrawerWidget(titulo: 'Categoria', icon: Icons.money,color: colorSecundary),
                  CardEndDrawerWidget(titulo: 'Categoria', icon: Icons.circle_notifications,color: colorSecundary),
                  CardEndDrawerWidget(titulo: 'Categoria', icon: Icons.abc,color: colorSecundary),
                  ListTile(
                    leading: const Icon(Icons.light_outlined, color: Colors.blue,),
                    title: const Text("Dark Mode"),
                    trailing: Switch.adaptive(
                                value: appTheme.darkTheme, 
                                onChanged: (value) => appTheme.darkTheme = value
                              ),
                      ),
                  ListTile(
                    leading: const Icon(Icons.add_to_home_screen, color: Colors.blue,),
                    title: const Text("Light Mode"),
                    trailing: Switch.adaptive(
                                value: appTheme.customTheme, 
                                onChanged: (value) => appTheme.customTheme = value
                              ),
                      ),
                ],
              ),
            ),
          ),
           ),
      ),
      drawer: Padding(
        padding:  EdgeInsets.only(top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top),
        child: Container(
          width: MediaQuery.of(context).size.width/2 +20,
          color: colorPrimary,
          child: SizedBox.expand(
            child: FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                   CardDrawerWidget(titulo: "Día", color: colorSecundary, fechaSeleccionada: fecha("dia")),
                   CardDrawerWidget(titulo: "Mes",color: colorSecundary, fechaSeleccionada: fecha("mes")),
                   CardDrawerWidget(titulo: "Año",color: colorSecundary, fechaSeleccionada: fecha("año")),
                   CardDrawerWidget(titulo: "Todo",color: colorSecundary, fechaSeleccionada: '',),
                ],
              ),
            ),
          ),),
      ),
      appBar: AppBar(
        backgroundColor:  colorSecundary,
            title: const Text("Finanzas personales"),
        ),
      body: PageView.builder(
        onPageChanged: (value) {
          // print(value);
        },
        reverse: true,
        itemCount: egresoIngresoService.listaCategoriaModificada.length,
        itemBuilder: (context, index) {
          // print("${usuario[index].fecha} ");
          // final   fecha = usuario[index].fecha,
          //         mesActual = DateTime.parse(fecha).month,
          //         mesAnterior = (mesActual ==1) ?12 :mesActual-1,
          //         mesSiguiente = (mesActual ==12) ?1 :mesActual+1;
                  // totalIngreso = egresoIngresoService.totalIngreso,
                  // totalGasto = egresoIngresoService.totalGasto;
                
                    // print(egresoIngresoService.totalIngreso);

          return Stack(
          children: [
                BarraMesesWidget(
                  mesAnterior: DateFormat.MMMM('es').format(DateTime(1,1)), 
                  mesactual: DateFormat.MMMM('es').format(DateTime(1,1)), 
                  mesSiguiente: (1 == DateTime.now().month)?"        ":DateFormat.MMMM('es').format(DateTime(1,1))
                  ),
                   IngresosEgresosWidget(
                  ingreso: "CLP ${egresoIngresoService.totalIngreso.toString()}", 
                  egreso: "CLP ${egresoIngresoService.totalGasto.toString()}"),
                // CategoriasPersonalizadasWidget(
                //   ancho: (MediaQuery.of(context).size.height <800) ? MediaQuery.of(context).size.height*0.5/100: MediaQuery.of(context).size.height*2/100,
                //   datos: data2,
                //   ),
                 GraficoDonutsNuevo(data: egresoIngresoService.listaCategoriaModificada,),
                 BottonModal(
                  saldo: ((egresoIngresoService.totalIngreso)-(egresoIngresoService.totalGasto)).toString(),
                  datos: egresoIngresoService.listaCategoriaModificada, 
                  colorSecundary: colorSecundary,
                  colorPrimary: colorPrimary,),     
        ],);
        },
      ),
      bottomNavigationBar: 
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 115,
                        width: 115,
                        decoration: BoxDecoration(
                          border: Border.all(width: 7, color: Colors.red),
                          borderRadius: BorderRadius.circular(80)),
                        child: IconButton(     
                                color: Colors.red,             
                                splashRadius: 50,     
                                iconSize: 40,        
                                icon: const Icon(Icons.remove_sharp,weight: 100,),
                                onPressed: (){

                                  Preferences.pagTitle = "gasto";
                                  Preferences.valorNuevo = "";
                                  Preferences.bloquear = false;
                                   egresoIngresoService.egresoIngresoSelect = EgresoIngresoBDModel(
                                    descripcion: "",
                                    tipo: "GASTO",
                                    fecha:DateTime.now().toString(),
                                    uid: "", 
                                    estado: true, 
                                    categoria: '', 
                                    valor: 0);
                                  Navigator.pushNamed(context, "nuevo");
                                }, 
                                ),
                      ),
                      Container(
                        height: 115,
                        width: 115,
                        decoration: BoxDecoration(
                          border: Border.all(width: 7, color: colorSecundary),
                          borderRadius: BorderRadius.circular(80)),
                        child: IconButton(                                  
                                color: colorSecundary,              
                                splashRadius: 60,  
                                iconSize: 40,        
                                icon: const Icon(Icons.add_sharp,),
                                onPressed: (){
                                  Preferences.pagTitle = "ingreso";
                                  Preferences.valorNuevo = "";
                                  Preferences.bloquear = false;

                                 egresoIngresoService.egresoIngresoSelect = EgresoIngresoBDModel(
                                  descripcion: "",
                                  tipo: "INGRESO",
                                  fecha:DateTime.now().toString(),
                                  uid: "", 
                                  estado: true, 
                                  categoria: '',                                   
                                  valor: 0);                                  

                                  Navigator.pushNamed(context, "nuevo");
                                 
                                }, 
                                ),
                      ),          
                          
                  ],),
                )
    );
  }

//TODO: Mejorar la utilización de la fecha para seleccionar fechas
  fecha(String diaMesYear){
        final dayMonthYearSeleccionado = Preferences.fechaSeleccionada.split("-");
      switch (diaMesYear) {
        case "dia":
          dayMonthYearSeleccionado;
          break;
        case "mes":
          dayMonthYearSeleccionado.removeLast();
          dayMonthYearSeleccionado;
          break;
        case "año":
        dayMonthYearSeleccionado.removeLast();
        dayMonthYearSeleccionado.removeLast();
           dayMonthYearSeleccionado;
          break;
        
      }

        return dayMonthYearSeleccionado.join('-');
  }
}


// TODO: 
//  1. Crear lista de categorias predeterminadas
//  2. Insertar la fecha a buscar en ingresoEgresoService
//  3. asignar correctamente la fecha al item BarraMesesWidget junto con bloquear 
