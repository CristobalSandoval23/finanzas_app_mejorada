import 'package:flutter/material.dart';

class CardEndDrawerWidget extends StatelessWidget {
  final String   titulo;
  final IconData icon;
  final double   top,
                 bottom;
  final Color    color;
  const CardEndDrawerWidget({Key? key, 
  required this.titulo, 
  required this.icon,
   this.color = Colors.black, 
   this.top = 10, 
   this.bottom = 10, 
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.pushNamed(context, "categoria"),
      child: Padding(
        padding:  EdgeInsets.only(top: top,bottom: bottom),
        child: Container(
          alignment: Alignment.center,    
          child:  Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Icon(icon,size: 40,color: color,),
              ),
              Text(titulo),
            ],
          ),
          ),
      ),
    );
  }
}