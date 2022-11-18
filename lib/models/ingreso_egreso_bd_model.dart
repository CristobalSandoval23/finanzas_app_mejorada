import 'dart:convert';

class EgresoIngresoBDModel {
    EgresoIngresoBDModel({
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
    String categoria;
    int? valor;

    factory EgresoIngresoBDModel.fromJson(String str) => EgresoIngresoBDModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EgresoIngresoBDModel.fromMap(Map<String, dynamic> json) => EgresoIngresoBDModel(
        descripcion: json["descripcion"],
        tipo: json["tipo"],
        fecha: json["fecha"],
        uid: json["uid"],
        estado: json["estado"],
        categoria: json["categoria"],
        valor: json["valor"],
    );

    Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "tipo": tipo,
        "fecha": fecha,
        "uid": uid,
        "estado": estado,
        "categoria": categoria,
        "valor": valor,
    };
    EgresoIngresoBDModel copy() => EgresoIngresoBDModel(
        descripcion: descripcion,
        tipo: tipo,
        fecha: fecha,
        uid: uid,
        estado: estado,
        categoria: categoria,
        valor: valor,
    );
}
