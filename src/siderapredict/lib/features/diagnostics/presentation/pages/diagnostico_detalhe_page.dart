import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/widgets/zoomable_image_overlay.dart';

class DiagnosticoDetalhePage extends StatelessWidget {
  const DiagnosticoDetalhePage({super.key});

  void _showImageOverlay(BuildContext context) {
    ZoomableImageOverlay.show(
      context,
      imageProvider: const AssetImage('assets/trinca.png'),
    );
  }

  Widget infoBox(String titulo, String valor) {
    return Container(
      width: 360,
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            "$titulo: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(valor)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          color: const Color(0xFFF4F6F8),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: primaryColor,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),

                    const Expanded(
                      child: Center(
                        child: Text(
                          "Diagnóstico",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 48),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              infoBox("Solicitação #00001", "26/02/2026 - 12:37"),
              const SizedBox(height: 12),

              infoBox("Falha detectada", "Trinca Térmica"),
              const SizedBox(height: 12),

              infoBox("Confiabilidade", "95%"),
              const SizedBox(height: 12),

              infoBox("Possível causa", "Excesso de Calor"),
              const SizedBox(height: 12),

              infoBox("Ajuste Recomendado", "Reduzir pressão em 9%"),

              const SizedBox(height: 50),

              GestureDetector(
                onTap: () => _showImageOverlay(context),
                child: SizedBox(
                  width: 255,
                  height: 255,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        const Image(
                          image: AssetImage("assets/trinca.png"),
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: GestureDetector(
                            onTap: () => _showImageOverlay(context),
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.fullscreen,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
