import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../../../../app/routes/app_routes.dart';
import '../../../../core/theme/theme.dart';
import '../../../../domain/models/inspection_request.dart';

class InspecaoEnviadaPage extends StatelessWidget {
  final InspectionRequest request;

  const InspecaoEnviadaPage({
    super.key,
    required this.request,
  });

  Future<void> _generateAndSharePdf(BuildContext context) async {
    // capture messenger synchronously to avoid use_build_context_synchronously
    final messenger = ScaffoldMessenger.of(context);

    final doc = pw.Document();

    pw.ImageProvider? img;
    if (request.imagePath.isNotEmpty) {
      try {
        final bytes = await File(request.imagePath).readAsBytes();
        img = pw.MemoryImage(bytes);
      } catch (_) {
        img = null;
      }
    }

    doc.addPage(
      pw.Page(
        build: (pw.Context ctx) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'Solicitação de Inspeção',
              style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 8),
            pw.Text('Número: ${request.requestId}'),
            pw.Text('Data: ${request.dateTime.toLocal()}'),
            pw.SizedBox(height: 8),
            pw.Text('Falha detectada: ${request.detectedFault}'),
            pw.Text('Confiabilidade: ${request.confidence}'),
            pw.SizedBox(height: 8),
            pw.Text('Possível causa: ${request.possibleCause}'),
            pw.Text('Ajuste recomendado: ${request.recommendedAdjustment}'),
            pw.Text('Seção / Máquina: ${request.sectionMachine}'),
            pw.SizedBox(height: 8),
            pw.Text('Observações:'),
            pw.Text(request.observations),
            if (img != null) pw.SizedBox(height: 12),
            if (img != null)
              pw.Center(child: pw.Image(img, width: 250, height: 250)),
          ],
        ),
      ),
    );

    final bytes = await doc.save();

    // Save to app documents directory so user has a local copy (Download-like)
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/solicitacao_${request.requestId}.pdf');
      await file.writeAsBytes(bytes);
      messenger.showSnackBar(
        SnackBar(content: Text('PDF salvo em: ${file.path}')),
      );
    } catch (e) {
      // ignore save errors, continue to share
    }

    // Open share/print sheet so user can save/export the PDF
    await Printing.sharePdf(
      bytes: bytes,
      filename: 'solicitacao_${request.requestId}.pdf',
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
        title: const Text(''),
        toolbarHeight: 86,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(18)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: subtleShadows,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 18,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Solicitação de Inspeção Enviada',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Número da Solicitação ${request.requestId}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 18),
                          Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              color: backgroundLight,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.check_box,
                                color: const Color(0xFF00BFA5),
                                size: 110,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF12A347),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                      AppRoutes.scanner,
                    );
                  },
                  child: const Text(
                    'NOVA INSPEÇÃO',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.menuPrincipal,
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'VOLTAR AO MENU PRINCIPAL',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.download_rounded),
                  label: const Text(
                    'DOWNLOAD',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => _generateAndSharePdf(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
