import 'package:flutter/material.dart';
import 'package:geoshield/model/alerta.dart';
import 'package:geoshield/navigation/app_routes.dart';
import 'package:geoshield/repository/alerta_repository.dart';
import 'package:geoshield/ui/components/alerta_card.dart';

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  late List<Alerta> listaAlertas;

  @override
  void initState() {
    super.initState();
    listaAlertas = getAllAlertas();
  }

  void filtrar(NivelRisco risco) {
    setState(() {
      listaAlertas = getAlertasByRisco(risco);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Áreas de Risco')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionChip(
                    label: const Text('Todos'),
                    onPressed: () =>
                        setState(() => listaAlertas = getAllAlertas())),
                ActionChip(
                    label: const Text('Alto Risco'),
                    backgroundColor: Colors.red.shade100,
                    onPressed: () => filtrar(NivelRisco.alto)),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: listaAlertas.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final alerta = listaAlertas[index];
                return AlertaCard(
                  alerta: alerta,
                  onClick: (alertaSelecionado) {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.detail,
                      arguments: alerta,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
