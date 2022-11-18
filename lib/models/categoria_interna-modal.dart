import 'dart:convert';

import 'package:finanzas_personal_2/models/ingreso_egreso_model.dart';

class CategoriaInternaModel {
    CategoriaInternaModel({
       required this.id,
       required this.nombre,
       required this.tipo,
       required this.total,
       required this.datos,
    });

    String id;
    String nombre;
    String tipo;
    double total;
    List<dynamic> datos;

    factory CategoriaInternaModel.fromJson(String str) => CategoriaInternaModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CategoriaInternaModel.fromMap(Map<String, dynamic> json) => CategoriaInternaModel(
        id: json["id"],
        nombre: json["nombre"],
        tipo: json["tipo"],
        total: json["total"],
        datos: List<dynamic>.from(json["datos"].map((x) => x.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "tipo": tipo,
        "total": total,
        "datos": List<dynamic>.from(datos.map((x) => x.toMap())),
    };
}
