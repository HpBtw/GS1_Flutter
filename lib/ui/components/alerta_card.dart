import 'package:flutter/material.dart';
import 'package:geoshield/model/alerta.dart';

class AlertaCard extends StatelessWidget {
  final Alerta alerta;
  final Function(Alerta)? onClick;

  const AlertaCard({super.key, required this.alerta, this.onClick});

  @override
  Widget build(BuildContext context) {
    Color corRisco = Colors.green;
    if (alerta.risco == NivelRisco.medio) corRisco = Colors.orange;
    if (alerta.risco == NivelRisco.alto) corRisco = Colors.red;

    return GestureDetector(
      onTap: onClick != null ? () => onClick!(alerta) : null,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: corRisco, size: 40),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(alerta.regiao,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(
                        'Risco: ${alerta.risco.nome} | Temp: ${alerta.temperatura}°C'),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
