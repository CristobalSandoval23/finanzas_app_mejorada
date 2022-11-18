import 'package:finanzas_personal_2/models/categoria-modal.dart';
import 'package:finanzas_personal_2/widgets/widget_producto/boton.dart';
import 'package:flutter/material.dart';

class CategoriasPersonalizadasWidget extends StatelessWidget {

  final double ancho;
  final Map datos;
  const CategoriasPersonalizadasWidget({Key? key, 
    required this.ancho, 
    required this.datos}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
      
    return SizedBox.expand(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            heightFactor: 0.8,
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                  Padding(
                    padding: EdgeInsets.only(bottom: ancho),
                    child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                              BotonWidget(icon: datos[1][0], porcentaje: datos[1][1],),                                                
                              BotonWidget(icon: datos[2][0], porcentaje: datos[2][1],),                                                
                              BotonWidget(icon: datos[3][0], porcentaje: datos[3][1],),                                                
                              BotonWidget(icon: datos[4][0], porcentaje: datos[4][1],),                                                
                              ],
                            ),
                         ),
                  Padding(
                    padding: EdgeInsets.only(top: ancho, bottom: ancho),
                    child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                              BotonWidget(icon: datos[5][0], porcentaje: datos[5][1],),                                                
                              BotonWidget(icon: datos[6][0], porcentaje: datos[6][1],),                                                
                              ],
                           ),
                         ),
                  Padding(
                    padding: EdgeInsets.only(top: ancho, bottom: ancho),
                    child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                              BotonWidget(icon: datos[5][0], porcentaje: datos[5][1],),                                                
                              BotonWidget(icon: datos[6][0], porcentaje: datos[6][1],),                                                
                              ],
                           ),
                         ),
                  Padding(
                    padding:  EdgeInsets.only(top: ancho, bottom: ancho),
                    child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:  [
                              BotonWidget(icon: datos[7][0], porcentaje: datos[7][1],),                                                
                              BotonWidget(icon: datos[8][0], porcentaje: datos[8][1],),                                     
                              ],
                           ),
                         ),
                  Padding(
                    padding:  EdgeInsets.only(top: ancho),
                    child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children:  [
                              BotonWidget(icon: datos[9][0], porcentaje: datos[9][1],),                                                
                              BotonWidget(icon: datos[10][0], porcentaje: datos[10][1],),                                     
                              BotonWidget(icon: datos[11][0], porcentaje: datos[11][1],),                                                
                              BotonWidget(icon: datos[12][0], porcentaje: datos[12][1],),                                     
                              ],
                            ),
                         ),
                    ],),
           ),
                );
  }
}