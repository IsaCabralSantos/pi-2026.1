import 'package:flutter/material.dart';

import 'inspecao_enviada.dart';

class EnvioSolicitacao extends StatefulWidget {
  final String anomalia;

  const EnvioSolicitacao({super.key, required this.anomalia});

  @override
  State<EnvioSolicitacao> createState() => _EnvioSolicitacaoState();
}

class _EnvioSolicitacaoState extends State<EnvioSolicitacao> {
  bool _isLoading = false;

  Future<void> _simularEnvio() async {
    setState(() => _isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const InspecaoEnviada(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Solicitação'),
        backgroundColor: Colors.red.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              color: Colors.red.shade50,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Anomalia detectada:\n${widget.anomalia}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _simularEnvio,
              icon: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.send),
              label: Text(_isLoading ? 'ENVIANDO...' : 'ENVIAR SOLICITAÇÃO'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
