import 'dart:convert';

class UsuarioModel {
    UsuarioModel({
       required this.msg,
       required this.usuario,
       required this.token,
    });

    String msg;
    Usuario usuario;
    String token;

    factory UsuarioModel.fromJson(String str) => UsuarioModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsuarioModel.fromMap(Map<String, dynamic> json) => UsuarioModel(
        msg: json["msg"],
        usuario: Usuario.fromMap(json["usuario"]),
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "msg": msg,
        "usuario": usuario.toMap(),
        "token": token,
    };
}

class Usuario {
    Usuario({
       required this.nombre,
       required this.correo,
       required this.rol,
       required this.estado,
       required this.google,
       required this.uid,
    });

    String nombre;
    String correo;
    String rol;
    bool estado;
    bool google;
    String uid;

    factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        correo: json["correo"],
        rol: json["rol"],
        estado: json["estado"],
        google: json["google"],
        uid: json["uid"],
    );

    Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "correo": correo,
        "rol": rol,
        "estado": estado,
        "google": google,
        "uid": uid,
    };
}
