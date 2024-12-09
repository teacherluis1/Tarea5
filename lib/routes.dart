import 'package:completarprofe/views/contacto_screen.dart';
import 'package:completarprofe/views/home_screen.dart';
import 'package:completarprofe/views/prestamo_calculadora.dart';
import 'package:completarprofe/views/quienes_somos_screen.dart';
import 'package:completarprofe/views/servicios_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String quienesSomos = '/quienes-somos';
  static const String servicios = '/servicios';
  static const String calculadora = '/calculadora';
  static const String contacto = '/contacto';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomeScreen(),
        quienesSomos: (context) => const QuienesSomos(),
        servicios: (context) => const Servicios(),
        calculadora: (context) => const PrestamoCalculadora(),
        contacto: (context) => Contacto()
      };
}