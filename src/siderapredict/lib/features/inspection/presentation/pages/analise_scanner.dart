import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../core/theme/theme.dart';
import '../../../../domain/models/inspection_request.dart';

class AnaliseScanner extends StatelessWidget {
  final String imagePath;

  const AnaliseScanner({super.key, required this.imagePath});

  Widget _infoCard(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: subtleShadows,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: darkTextColor,
                  fontSize: 16,
                  shadows: textShadows,
                ),
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      shadows: textShadows,
                    ),
                  ),
                  TextSpan(
                    text: value,
                    style: const TextStyle(shadows: textShadows),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLighter,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Resultado da Análise',
          style: TextStyle(color: Colors.white, shadows: textShadows),
        ),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _infoCard('Falha detectada', 'Trinca Térmica'),
            _infoCard('Confiabilidade', '95%'),
            _infoCard('Possível causa', 'Excesso de Calor'),
            _infoCard('Ajuste Recomendado', 'Reduzir pressão em 9%'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: subtleShadows,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: imagePath.isNotEmpty
                      ? Image.file(
                          File(imagePath),
                          fit: BoxFit.cover,
                        )
                      : const Center(child: Text('Nenhuma imagem')),
                ),
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  elevation: 6,
                  shadowColor: blackColor.withValues(alpha: 0.25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  final request = InspectionRequest(
                    requestId: '#00001',
                    dateTime: DateTime.now(),
                    detectedFault: 'Trinca Térmica',
                    confidence: '95%',
                    possibleCause: 'Excesso de Calor',
                    recommendedAdjustment: 'Reduzir pressão em 9%',
                    sectionMachine: 'F1 - Máquina 23',
                    imagePath: imagePath,
                  );
                  Navigator.of(context).pushNamed(
                    AppRoutes.envioSolicitacao,
                    arguments: request,
                  );
                },
                child: const Text(
                  'GERAR SOLICITAÇÃO',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    shadows: textShadows,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
