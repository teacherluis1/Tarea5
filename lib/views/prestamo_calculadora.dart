import 'package:flutter/material.dart';
import 'dart:math';

class PrestamoCalculadora extends StatefulWidget {
  const PrestamoCalculadora({super.key});

  @override
  State<PrestamoCalculadora> createState() => _PrestamoCalculadoraState();
}

class _PrestamoCalculadoraState extends State<PrestamoCalculadora> {
  final _formKey = GlobalKey<FormState>();
  final montoController = TextEditingController();
  final plazoController = TextEditingController();
  final interesController = TextEditingController();

  List<Map<String, dynamic>> tablaAmortizacion = [];
  double? cuotaMensual;
  double? interesTotal;

  void _calcularPrestamo() {
    if (!_formKey.currentState!.validate()) return;

    double monto = double.parse(montoController.text);
    int plazo = int.parse(plazoController.text);
    double tasaAnual = double.parse(interesController.text);

    double tasaMensual = tasaAnual / 12 / 100;
    double cuota = monto *
        (tasaMensual * pow((1 + tasaMensual), plazo)) /
        (pow((1 + tasaMensual), plazo) - 1);

    tablaAmortizacion.clear();
    double balance = monto;
    double totalInteres = 0;

    for (int i = 1; i <= plazo; i++) {
      double interesMensual = balance * tasaMensual;
      double capital = cuota - interesMensual;
      balance -= capital;
      totalInteres += interesMensual;

      tablaAmortizacion.add({
        'numero': i,
        'cuota': cuota,
        'capital': capital,
        'interes': interesMensual,
        'balance': balance > 0 ? balance : 0,
      });
    }

    setState(() {
      cuotaMensual = cuota;
      interesTotal = totalInteres;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Préstamos'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Datos del Préstamo',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 24),
                        TextFormField(
                          controller: montoController,
                          decoration: const InputDecoration(
                            labelText: 'Monto del préstamo',
                            prefixText: '\$',
                            hintText: 'Ejemplo: 10000',
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese el monto';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: plazoController,
                          decoration: const InputDecoration(
                            labelText: 'Plazo (meses)',
                            hintText: 'Ejemplo: 12',
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese el plazo';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: interesController,
                          decoration: const InputDecoration(
                            labelText: 'Tasa de interés anual',
                            suffixText: '%',
                            hintText: 'Ejemplo: 12.5',
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese la tasa de interés';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _calcularPrestamo,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Calcular',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (cuotaMensual != null) ...[
                  const SizedBox(height: 24),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Resumen del Préstamo',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ResultadoRow(
                            label: 'Cuota mensual',
                            value: '\$${cuotaMensual!.toStringAsFixed(2)}',
                          ),
                          const SizedBox(height: 8),
                          ResultadoRow(
                            label: 'Total en intereses',
                            value: '\$${interesTotal!.toStringAsFixed(2)}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: IntrinsicWidth(
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Tabla de Amortización',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                DataTable(
                                  headingTextStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  columns: const [
                                    DataColumn(label: Text('No.')),
                                    DataColumn(label: Text('Cuota')),
                                    DataColumn(label: Text('Capital')),
                                    DataColumn(label: Text('Interés')),
                                    DataColumn(label: Text('Balance')),
                                  ],
                                  rows: tablaAmortizacion.map((row) {
                                    return DataRow(cells: [
                                      DataCell(Text(row['numero'].toString())),
                                      DataCell(Text(
                                          '\$${row['cuota'].toStringAsFixed(2)}')),
                                      DataCell(Text(
                                          '\$${row['capital'].toStringAsFixed(2)}')),
                                      DataCell(Text(
                                          '\$${row['interes'].toStringAsFixed(2)}')),
                                      DataCell(Text(
                                          '\$${row['balance'].toStringAsFixed(2)}')),
                                    ]);
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResultadoRow extends StatelessWidget {
  final String label;
  final String value;

  const ResultadoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}