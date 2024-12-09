import 'package:flutter/material.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
              child: Column(
            children: [
              Icon(
                Icons.account_balance,
                size: 48,
              ),
              SizedBox(
                height: 8,
              ),
              Text('FinanTech')
            ],
          )),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("Quiénes somos"),
            onTap: () {
              Navigator.pushNamed(context, '/quienes-somos');
            },
          ),
          ListTile(
            leading: const Icon(Icons.business_center),
            title: const Text("Servicios"),
            onTap: () {
              Navigator.pushNamed(context, '/servicios');
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text("Calcular Préstamo"),
            onTap: () {
              Navigator.pushNamed(context, '/calculadora');
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_phone),
            title: const Text("Contacto"),
            onTap: () {
              Navigator.pushNamed(context, '/contacto');
            },
          ),
        ],
      ),
    );
  }
}