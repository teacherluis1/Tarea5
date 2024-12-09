import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildNavButton(
            context: context,
            title: 'Inicio',
            route: '/',
            icon: Icons.home_outlined),
        _buildNavButton(
            context: context,
            title: 'Quiénes somos',
            route: '/quienes-somos',
            icon: Icons.info_outline),
        _buildNavButton(
            context: context,
            title: 'Servicios',
            route: '/servicios',
            icon: Icons.business_center_outlined),
        _buildCalculatorButton(
            context: context,
            title: 'Calcular préstamo',
            route: '/calculadora',
            icon: Icons.calculate_outlined),
        _buildNavButton(
            context: context,
            title: 'Contacto',
            route: '/contacto',
            icon: Icons.contact_phone_outlined),
      ],
    );
  }

  Widget _buildNavButton({
    required BuildContext context,
    required String title,
    required String route,
    required IconData icon,
  }) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          child: TextButton(
            onPressed: () => Navigator.pushNamed(context, route),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildCalculatorButton({
    required BuildContext context,
    required String title,
    required String route,
    required IconData icon,
  }) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary
              ]),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4))
              ]),
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, route),
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16))),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                )
              ],
            ),
          ),
        ));
  }
}