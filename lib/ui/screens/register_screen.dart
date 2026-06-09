import 'package:flutter/material.dart';
import 'package:geoshield/model/alerta.dart';
import 'package:geoshield/repository/alerta_repository.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _temperaturaController = TextEditingController();
  double raioMonitoramento = 50.0;
  bool ativarAlertasSms = true;
  String biomaSelecionado = 'Amazônia';
  NivelRisco riscoSelecionado = NivelRisco.baixo;

  final List<String> biomas = [
    'Amazônia',
    'Cerrado',
    'Mata Atlântica',
    'Pantanal',
    'Pampa',
    'Caatinga'
  ];

  @override
  void dispose() {
    _nomeController.dispose();
    _temperaturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Área')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome da Área',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.map),
              ),
            ),
            const SizedBox(height: 24),
            DropdownButtonFormField<String>(
              value: biomaSelecionado,
              decoration: const InputDecoration(
                labelText: 'Bioma Predominante',
                border: OutlineInputBorder(),
              ),
              items: biomas.map((bioma) {
                return DropdownMenuItem(value: bioma, child: Text(bioma));
              }).toList(),
              onChanged: (value) => setState(() => biomaSelecionado = value!),
            ),
            const SizedBox(height: 24),
            const Text(
              'Nível de Risco Inicial',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: NivelRisco.values.map((risco) {
                  return RadioListTile<NivelRisco>(
                    title: Text(risco.nome),
                    value: risco,
                    groupValue: riscoSelecionado,
                    activeColor: Colors.blueGrey,
                    onChanged: (NivelRisco? value) {
                      if (value != null) {
                        setState(() {
                          riscoSelecionado = value;
                        });
                      }
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _temperaturaController,
              decoration: const InputDecoration(
                labelText: 'Temperatura registrada',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.thermostat),
              ),
            ),
            const SizedBox(height: 24),
            Text('Raio de Monitoramento: ${raioMonitoramento.toInt()} km'),
            Slider(
              value: raioMonitoramento,
              min: 10,
              max: 500,
              divisions: 49,
              onChanged: (value) => setState(() => raioMonitoramento = value),
            ),
            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Ativar alertas via SMS para Defesa Civil',
                    style: TextStyle(fontSize: 16)),
                Switch(
                  value: ativarAlertasSms,
                  onChanged: (value) =>
                      setState(() => ativarAlertasSms = value),
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton(
                onPressed: () {
                  if (_nomeController.text.isNotEmpty) {
                    final novoCadastro = Alerta(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      regiao: '$biomaSelecionado - ${_nomeController.text}',
                      risco: riscoSelecionado,
                      temperatura: double.parse(_temperaturaController.text),
                      raioMonitoramento: raioMonitoramento,
                    );

                    cadastrarNovoAlerta(novoCadastro);

                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Região ${_nomeController.text} cadastrada!')),
                    );
                  }
                },
                child: const Text('Salvar Cadastro',
                    style: TextStyle(fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
