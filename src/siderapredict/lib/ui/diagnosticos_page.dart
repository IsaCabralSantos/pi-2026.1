import 'package:flutter/material.dart';
import 'diagnostico_detalhe_page.dart';

class DiagnosticosPage extends StatelessWidget {
  const DiagnosticosPage({super.key});

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

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DiagnosticoDetalhePage(),
                  ),
                );
              },
              child: Container(
                width: 360,
                height: 150,
                padding: const EdgeInsets.all(12),
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

                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage("assets/trinca.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Solicitação #00001",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 6),

                        Text(
                          "Trinca Térmica",
                          style: TextStyle(fontSize: 15),
                        ),

                        SizedBox(height: 6),

                        Text(
                          "26/02/2026 - 12:37",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}