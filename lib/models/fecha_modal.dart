import 'dart:convert';

class FechaModel {
    FechaModel({
       required this.year,
       required this.mes,
       required this.dia,
    });

    String year;
    String mes;
    String dia;

    factory FechaModel.fromJson(String str) => FechaModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FechaModel.fromMap(Map<String, dynamic> json) => FechaModel(
        year: json["year"],
        mes: json["mes"],
        dia: json["dia"],
    );

    Map<String, dynamic> toMap() => {
        "year": year,
        "mes": mes,
        "dia": dia,
    };
}
