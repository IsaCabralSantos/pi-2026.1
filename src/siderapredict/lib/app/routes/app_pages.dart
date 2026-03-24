import 'package:flutter/material.dart';

import '../../domain/models/inspection_request.dart';
import '../../features/diagnostics/presentation/pages/diagnostico_detalhe_page.dart';
import '../../features/diagnostics/presentation/pages/diagnosticos_page.dart';
import '../../features/inspection/presentation/pages/analise_scanner.dart';
import '../../features/inspection/presentation/pages/envio_solicitacao.dart';
import '../../features/inspection/presentation/pages/inspecao_enviada.dart';
import '../../features/inspection/presentation/pages/scanner.dart';
import '../../features/menu/presentation/pages/menu_principal.dart';
import '../../features/reports/presentation/pages/dashboard_relatorios.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import 'app_routes.dart';

class AnaliseScannerArgs {
  final String imagePath;

  const AnaliseScannerArgs({required this.imagePath});
}

class AppPages {
  const AppPages._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute<void>(
          builder: (_) => const SplashPage(),
          settings: settings,
        );
      case AppRoutes.menuPrincipal:
        return MaterialPageRoute<void>(
          builder: (_) => const MenuPrincipalPage(),
          settings: settings,
        );
      case AppRoutes.scanner:
        return MaterialPageRoute<void>(
          builder: (_) => const ScannerPage(),
          settings: settings,
        );
      case AppRoutes.analiseScanner:
        final args = settings.arguments;
        if (args is! AnaliseScannerArgs) {
          return _errorRoute(
            settings,
            'Argumentos invalidos para analise scanner.',
          );
        }
        return MaterialPageRoute<void>(
          builder: (_) => AnaliseScanner(imagePath: args.imagePath),
          settings: settings,
        );
      case AppRoutes.envioSolicitacao:
        final args = settings.arguments;
        if (args is! InspectionRequest) {
          return _errorRoute(
            settings,
            'Argumentos invalidos para envio de solicitacao.',
          );
        }
        return MaterialPageRoute<void>(
          builder: (_) => EnvioSolicitacaoPage(request: args),
          settings: settings,
        );
      case AppRoutes.inspecaoEnviada:
        final args = settings.arguments;
        if (args is! InspectionRequest) {
          return _errorRoute(
            settings,
            'Argumentos invalidos para inspecao enviada.',
          );
        }
        return MaterialPageRoute<void>(
          builder: (_) => InspecaoEnviadaPage(request: args),
          settings: settings,
        );
      case AppRoutes.diagnosticos:
        return MaterialPageRoute<void>(
          builder: (_) => const DiagnosticosPage(),
          settings: settings,
        );
      case AppRoutes.diagnosticoDetalhe:
        return MaterialPageRoute<void>(
          builder: (_) => const DiagnosticoDetalhePage(),
          settings: settings,
        );
      case AppRoutes.dashboardRelatorios:
        return MaterialPageRoute<void>(
          builder: (_) => const DashboardRelatoriosPage(),
          settings: settings,
        );
      default:
        return _errorRoute(settings, 'Rota nao encontrada: ${settings.name}');
    }
  }

  static Route<dynamic> _errorRoute(RouteSettings settings, String message) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Erro de navegacao')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              message,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
