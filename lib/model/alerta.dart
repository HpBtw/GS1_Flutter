import 'package:equatable/equatable.dart';

enum NivelRisco { baixo, medio, alto }

extension NivelRiscoExtension on NivelRisco {
  String get nome {
    switch (this) {
      case NivelRisco.baixo:
        return 'Baixo';
      case NivelRisco.medio:
        return 'Médio';
      case NivelRisco.alto:
        return 'Alto';
    }
  }
}

class Alerta extends Equatable {
  final String id;
  final String regiao;
  final NivelRisco risco;
  final double temperatura;
  final double raioMonitoramento;

  const Alerta({
    required this.id,
    required this.regiao,
    required this.risco,
    required this.temperatura,
    required this.raioMonitoramento
  });

  @override
  List<Object?> get props => [id, regiao, risco, temperatura, raioMonitoramento];
}
