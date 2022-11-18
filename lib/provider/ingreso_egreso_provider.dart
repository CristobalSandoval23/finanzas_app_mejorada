import 'package:flutter/material.dart';

import '../models/ingreso_egreso_bd_model.dart';

class EgresoIngresoFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

 late EgresoIngresoBDModel ingresoEgreso;

  EgresoIngresoFormProvider(this.ingresoEgreso);

  bool isValidForm(){
    return formKey.currentState?.validate() ?? false;
  }
}