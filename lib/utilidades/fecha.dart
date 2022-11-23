import 'package:intl/intl.dart';


String formatoFechaModificado(String fechaElegida){

    final formato = DateFormat('yyyy-MM-d');
    final fechaSeleccionada = formato.format(DateTime.parse(fechaElegida));
 
    return fechaSeleccionada;
}