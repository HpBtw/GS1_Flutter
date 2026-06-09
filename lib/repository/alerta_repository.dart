import '../model/alerta.dart';

List<Alerta> getAllAlertas() {
  return const [
    Alerta(
        id: '1',
        regiao: 'Amazônia - Setor Norte',
        risco: NivelRisco.alto,
        temperatura: 39.5),
    Alerta(
        id: '2',
        regiao: 'Pantanal - Sul',
        risco: NivelRisco.medio,
        temperatura: 36.2),
    Alerta(
        id: '3',
        regiao: 'Mata Atlântica',
        risco: NivelRisco.baixo,
        temperatura: 28.0),
    Alerta(
        id: '4',
        regiao: 'Cerrado - Leste',
        risco: NivelRisco.alto,
        temperatura: 40.1),
  ];
}

List<Alerta> getAlertasByRisco(NivelRisco riscoBusca) {
  return getAllAlertas().where((alerta) => alerta.risco == riscoBusca).toList();
}
