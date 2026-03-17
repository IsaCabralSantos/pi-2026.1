import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dashboard_relatorios.dart';
import 'diagnosticos_page.dart';
import 'scanner.dart';
import 'theme.dart';

class MenuPrincipalPage extends StatelessWidget {
  const MenuPrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: primaryColor, statusBarIconBrightness: Brightness.light));
    return Scaffold(
      backgroundColor: backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              color: primaryColor,
              child: Center(
                child: Text(
                  "Menu Principal",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    shadows: textShadows,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: 370,
              height: 165,
              child: MenuCard(
                icon: Icons.camera_alt_outlined,
                title: "NOVA INSPEÇÃO",
                page: ScannerPage(),
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

                SizedBox(
                  width: 175,
                  height: 165,
                  child: MenuCard(
                    icon: Icons.bar_chart_outlined,
                    title: "RELATÓRIOS",
                    page: DashboardRelatoriosPage(),
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
          boxShadow: subtleShadows,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: darkTextColor,
            ),

            const SizedBox(height: 12),

            Text(
              title,
              style: TextStyle(
                color: darkTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                shadows: textShadows,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
