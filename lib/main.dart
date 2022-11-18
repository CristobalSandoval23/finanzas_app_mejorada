import 'package:finanzas_personal_2/services/calculadora_service.dart';
import 'package:finanzas_personal_2/services/categoria_service.dart';
import 'package:finanzas_personal_2/services/egreso_ingreso_service.dart';
import 'package:finanzas_personal_2/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:finanzas_personal_2/pages/categoria.dart';
import 'package:finanzas_personal_2/pages/home.dart';
import 'package:finanzas_personal_2/pages/egreso-ingreso.dart';
import 'package:finanzas_personal_2/share_preferences/preferencias.dart';
import 'package:finanzas_personal_2/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(    
  MultiProvider(
    providers: [
            ChangeNotifierProvider(create: (_) => ThemeChanger(1)),
            ChangeNotifierProvider(create: (_) => EgresoIngresoService()),      
            ChangeNotifierProvider(create: (_) => LoginService()),
            ChangeNotifierProvider(create: (_) => CalculadoraService()),
            ChangeNotifierProvider(create: (_) => CategoriaService()),      
    ],
    child: const MyApp()
  ),
  
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => const HomePage(),
        'nuevo': ( _ ) => const PageIngresoEgreso(),
        'categoria': ( _ ) =>  CategoriaPage(),
      },
      theme: currentTheme
    );
  }
}

