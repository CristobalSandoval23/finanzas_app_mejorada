import 'dart:convert';

class CategoriaModal {
    CategoriaModal({
       required this.id,
       required this.nombre,
       required this.color,
       required this.icon,
        // this.ingresoEgreso,
    });

    String id;
    String nombre;
    int color;
    int icon;

    factory CategoriaModal.fromJson(String str) => CategoriaModal.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CategoriaModal.fromMap(Map<String, dynamic> json) => CategoriaModal(
        id: json["_id"],
        nombre: json["nombre"],
        color: json["color"],
        icon: json["icon"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
        "color": color,
        "icon": icon,
    };
}