import 'package:flutter/material.dart';

import 'analise_scanner.dart';

class InspecaoEnviada extends StatelessWidget {
  const InspecaoEnviada({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_rounded,
                size: 140,
                color: Colors.green,
              ),
              const SizedBox(height: 30),
              const Text(
                'SOLICITAÇÃO ENVIADA\nCOM SUCESSO!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B5E20),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Equipe de manutenção notificada.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AnaliseScanner(),
                    ),
                  );
                },
                icon: const Icon(Icons.camera_alt),
                label: const Text('NOVA INSPEÇÃO'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
