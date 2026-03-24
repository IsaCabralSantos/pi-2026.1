import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../core/theme/theme.dart';

class MenuPrincipalPage extends StatelessWidget {
  const MenuPrincipalPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          color: backgroundLight,
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
                child: const MenuCard(
                  icon: Icons.camera_alt_outlined,
                  title: 'NOVA INSPEÇÃO',
                  routeName: AppRoutes.scanner,
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 175,
                    height: 165,
                    child: const MenuCard(
                      icon: Icons.fact_check_outlined,
                      title: 'DIAGNÓSTICOS',
                      routeName: AppRoutes.diagnosticos,
                    ),
                  ),

                  const SizedBox(width: 20),

                  SizedBox(
                    width: 175,
                    height: 165,
                    child: const MenuCard(
                      icon: Icons.bar_chart_outlined,
                      title: 'RELATÓRIOS',
                      routeName: AppRoutes.dashboardRelatorios,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String routeName;

  const MenuCard({
    super.key,
    required this.icon,
    required this.title,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(routeName),
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
