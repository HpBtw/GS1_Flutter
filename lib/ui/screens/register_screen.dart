import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nomeController = TextEditingController();
  double raioMonitoramento = 50.0;
  bool ativarAlertasSms = true;
  String biomaSelecionado = 'Amazônia';

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Região')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome da Região',
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
                    Navigator.pop(context); // Retorna ao Dashboard
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
