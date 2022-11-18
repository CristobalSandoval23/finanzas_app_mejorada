import 'dart:convert';

import 'categoria-modal.dart';

class EgresoIngresoModel {
    EgresoIngresoModel({
        required this.descripcion,
        required this.tipo,
        required this.uid,
        required this.fecha,
         this.estado,
        required this.categoria,
         this.valor,
    });

    String descripcion;
    String tipo;
    String fecha;
    String uid;
    bool? estado;
    CategoriaModal categoria;
    int? valor;

    factory EgresoIngresoModel.fromJson(String str) => EgresoIngresoModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EgresoIngresoModel.fromMap(Map<String, dynamic> json) => EgresoIngresoModel(
        descripcion: json["descripcion"],
        tipo: json["tipo"],
        fecha: json["fecha"],
        uid: json["uid"],
        estado: json["estado"],
        categoria: CategoriaModal.fromMap(json["categoria"]),
        valor: json["valor"],
    );

    Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "tipo": tipo,
        "fecha": fecha,
        "uid": uid,
        "estado": estado,
        "categoria": categoria.toMap(),
        "valor": valor,
    };
    EgresoIngresoModel copy() => EgresoIngresoModel(
        descripcion: descripcion,
        tipo: tipo,
        fecha: fecha,
        uid: uid,
        estado: estado,
        categoria: categoria,
        valor: valor,
    );
}
