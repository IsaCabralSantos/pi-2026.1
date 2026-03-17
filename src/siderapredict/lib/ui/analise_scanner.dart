import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'envio_solicitacao.dart';

class AnaliseScanner extends StatefulWidget {
  const AnaliseScanner({super.key});

  @override
  State<AnaliseScanner> createState() => _AnaliseScannerState();
}

class _AnaliseScannerState extends State<AnaliseScanner> {
  CameraController? _cameraController;
  String _statusText = 'Enquadre a peça corretamente';
  Color _statusColor = Colors.orange;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    try {
      final cameras = await availableCameras();
      final backCamera = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      _cameraController = CameraController(backCamera, ResolutionPreset.high);

      await _cameraController!.initialize();

      if (!mounted) return;
      setState(() {});
    } catch (e) {
      setState(() {
        _statusText = 'Erro ao abrir câmera';
        _statusColor = Colors.red;
      });
    }
  }

  Future<void> _simularAnalise() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    try {
      await _cameraController!.takePicture();
      await Future.delayed(const Duration(seconds: 2));

      final resultados = [
        ('PEÇA APROVADA', Colors.green),
        ('ANOMALIA DETECTADA\n(Trincas visíveis)', Colors.red),
        ('FALHA NA LEITURA\nAjuste o ângulo', Colors.orange),
      ];

      final resultado = resultados[DateTime.now().millisecond % 3];

      if (!mounted) return;
      setState(() {
        _statusText = resultado.$1;
        _statusColor = resultado.$2;
      });

      if (_statusColor == Colors.red && mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                const EnvioSolicitacao(anomalia: 'Trincas na superfície'),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _statusText = 'Erro durante análise';
        _statusColor = Colors.red;
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (_cameraController != null &&
              _cameraController!.value.isInitialized)
            CameraPreview(_cameraController!)
          else
            const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),

          Center(
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 6),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: _statusColor.withValues(alpha: 0.92),
              child: Text(
                _statusText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: FloatingActionButton.extended(
          backgroundColor: _statusColor,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.camera_alt),
          label: const Text('ANALISAR PEÇA'),
          onPressed: _simularAnalise,
        ),
      ),
    );
  }
}
