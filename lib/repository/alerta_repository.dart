import 'package:geoshield/model/alerta.dart';

final List<Alerta> _mock = [
  const Alerta(
      id: '1',
      regiao: 'Amazônia - Setor Norte',
      risco: NivelRisco.alto,
      temperatura: 39.5,
      raioMonitoramento: 150.0),
  const Alerta(
      id: '2',
      regiao: 'Pantanal - Sul',
      risco: NivelRisco.medio,
      temperatura: 36.2,
      raioMonitoramento: 80.0),
  const Alerta(
      id: '3',
      regiao: 'Mata Atlântica',
      risco: NivelRisco.baixo,
      temperatura: 28.0,
      raioMonitoramento: 50.0),
  const Alerta(
      id: '4',
      regiao: 'Cerrado - Leste',
      risco: NivelRisco.alto,
      temperatura: 40.1,
      raioMonitoramento: 120.0),
];

List<Alerta> getAllAlertas() {
  return _mock;
}

List<Alerta> getAlertasByRisco(NivelRisco riscoBusca) {
  return _mock.where((alerta) => alerta.risco == riscoBusca).toList();
}

void cadastrarNovoAlerta(Alerta novoAlerta) {
  _mock.add(novoAlerta);
}
