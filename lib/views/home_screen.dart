
import 'package:flutter/material.dart';
import 'package:completarprofe/views/widgets/app_bar_actions.dart';
import 'package:completarprofe/views/widgets/feature_card.dart';
import 'package:completarprofe/views/widgets/navigation_drawer.dart';
import 'package:completarprofe/views/widgets/principal_section.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width >= 600;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A237E),
          title: const Text('FinanTech'),
          actions: isDesktop ? const [AppBarActions()] : null,
        ),
        drawer: isDesktop ? null : const CustomNavigationDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const PrincipalSection(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 48,
                ),
                child: Column(
                  children: [
                    const Text(
                      'Nuestros servicios',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    SizedBox(
                        width: 1000,
                        child: GridView.count(
                          crossAxisCount: isDesktop ? 3 : 1,
                          shrinkWrap: true,
                          mainAxisSpacing: 24,
                          crossAxisSpacing: 24,
                          childAspectRatio: 1.2,
                          physics: const NeverScrollableScrollPhysics(),
                          children: const [
                            FeatureCard(
                              icon: Icons.attach_money,
                              title: 'Préstamos Personales',
                              description:
                                  'Tasas competitivas y plazos flexibles adaptados a tus necesidades',
                            ),
                            FeatureCard(
                              icon: Icons.business,
                              title: 'Préstamos Empresariales',
                              description:
                                  'Impulsa tu negocio con nuestras soluciones financieras',
                            ),
                            FeatureCard(
                              icon: Icons.home,
                              title: 'Préstamos Hipotecarios',
                              description:
                                  'Haz realidad el sueño de tu casa propia',
                            ),
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}