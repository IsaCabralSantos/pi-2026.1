import 'package:flutter/material.dart';
import 'diagnosticos_page.dart';

class MenuPrincipalPage extends StatelessWidget {
  const MenuPrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      body: SafeArea(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              color: const Color(0xFFDE1212),
              child: const Center(
                child: Text(
                  "Menu Principal",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            const SizedBox(
              width: 370,
              height: 165,
              child: MenuCard(
                icon: Icons.camera_alt_outlined,
                title: "NOVA INSPEÇÃO",
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  width: 175,
                  height: 165,
                  child: MenuCard(
                    icon: Icons.fact_check_outlined,
                    title: "DIAGNÓSTICOS",
                    page: DiagnosticosPage(),
                  ),
                ),

                const SizedBox(width: 20),

                const SizedBox(
                  width: 175,
                  height: 165,
                  child: MenuCard(
                    icon: Icons.bar_chart_outlined,
                    title: "RELATÓRIOS",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? page;

  const MenuCard({
    super.key,
    required this.icon,
    required this.title,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page!),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              icon,
              size: 40,
              color: const Color(0xFF1A1A1A),
            ),

            const SizedBox(height: 12),

            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF1A1A1A),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}