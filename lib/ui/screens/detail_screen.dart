import 'package:flutter/material.dart';
import 'package:geoshield/model/alerta.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool dadosAtualizados = false;

  @override
  Widget build(BuildContext context) {
    final alerta = ModalRoute.of(context)?.settings.arguments as Alerta;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes da Telemetria')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(alerta.regiao,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Divider(height: 32),
            Text('ID do Sensor: ${alerta.id}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(
              'Raio de Monitoramento: ${alerta.raioMonitoramento.toInt()} km',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Temperatura Lida: ${dadosAtualizados ? alerta.temperatura + 1.2 : alerta.temperatura}°C',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text('Nível de Risco Oficial: ${alerta.risco.nome}',
                style: const TextStyle(fontSize: 18)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  setState(() {
                    dadosAtualizados = !dadosAtualizados;
                  });
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('Dados orbitais atualizados com sucesso!')),
                  );
                },
                child: const Text('Solicitar nova Leitura Orbital'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
