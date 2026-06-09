import "package:flutter/material.dart";
import "package:geoshield/navigation/app_routes.dart";

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Container(
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.public,
                            size: 120,
                            color: Colors.blueGrey,
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "O GeoShield é a sua ferramenta definitiva para a Indústria Espacial. "
                        "Cruzamos dados de satélites em tempo real para monitorar desastres "
                        "climáticos em escala global. \n\n"
                        "Nossa tecnologia de monitoramento orbital fornece alertas precoces "
                        "essenciais para a proteção de áreas vulneráveis e a preservação "
                        "de ecossistemas estratégicos. \n\n"
                        "Inicie o monitoramento agora e esteja sempre um passo à frente.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, color: Colors.black54, height: 1),
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FilledButton.icon(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  AppRoutes.dashboard, (route) => false);
                            },
                            icon: const Icon(Icons.arrow_forward),
                            label: const Text("Começar"),
                          )
                        ],
                      )
                    ]))));
  }
}
