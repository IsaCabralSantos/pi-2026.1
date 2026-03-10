import 'package:flutter/material.dart';

class DiagnosticoDetalhePage extends StatelessWidget {
  const DiagnosticoDetalhePage({super.key});

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
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Text(
            "$titulo: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(valor))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: SafeArea(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 20),
              color: const Color(0xFFDE1212),
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

            Container(
              width: 255,
              height: 255,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage("assets/trinca.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}