import 'package:flutter/material.dart';

import 'package:finanzas_personal_2/share_preferences/preferencias.dart';

class BotonWidget extends StatelessWidget {

   final IconData icon;
   final int porcentaje;

  const BotonWidget({
    super.key,  
    required this.icon, 
    required this.porcentaje
    });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
                    icon:  Icon(icon),
                    iconSize: 40,
                    padding: const EdgeInsets.all(1),
                    color: Colors.amber,
                    focusColor: Colors.black,
                    splashColor: Colors.black,
                    highlightColor: Colors.black,
                    hoverColor: Colors.black,
                    tooltip: 'Show Snackbar',
                    onPressed: () {                   
                      Preferences.pagTitle = "gasto";
                      Navigator.pushNamed(context, "nuevo");
                    },
                  ),
                     Text("$porcentaje%")
      ],
    );
  }
}