import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'menu_principal.dart';
import 'scanner.dart';
import 'theme.dart';

class InspecaoEnviadaPage extends StatelessWidget {
  final String requestId;
  final DateTime dateTime;
  final String detectedFault;
  final String confidence;
  final String possibleCause;
  final String recommendedAdjustment;
  final String sectionMachine;
  final String imagePath;
  final String observations;

  const InspecaoEnviadaPage({
    super.key,
    required this.requestId,
    required this.dateTime,
    required this.detectedFault,
    required this.confidence,
    required this.possibleCause,
    required this.recommendedAdjustment,
    required this.sectionMachine,
    required this.imagePath,
    required this.observations,
  });

  Future<void> _generateAndSharePdf(BuildContext context) async {
    // capture messenger synchronously to avoid use_build_context_synchronously
    final messenger = ScaffoldMessenger.of(context);

    final doc = pw.Document();

    pw.ImageProvider? img;
    if (imagePath.isNotEmpty) {
      try {
        final bytes = await File(imagePath).readAsBytes();
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
            pw.Text('Número: $requestId'),
            pw.Text('Data: ${dateTime.toLocal()}'),
            pw.SizedBox(height: 8),
            pw.Text('Falha detectada: $detectedFault'),
            pw.Text('Confiabilidade: $confidence'),
            pw.SizedBox(height: 8),
            pw.Text('Possível causa: $possibleCause'),
            pw.Text('Ajuste recomendado: $recommendedAdjustment'),
            pw.Text('Seção / Máquina: $sectionMachine'),
            pw.SizedBox(height: 8),
            pw.Text('Observações:'),
            pw.Text(observations),
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
      final file = File('${dir.path}/solicitacao_$requestId.pdf');
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
      filename: 'solicitacao_$requestId.pdf',
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
                            'Número da Solicitação #$requestId',
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => ScannerPage()),
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
                    backgroundColor: const Color(0xFFDE1212),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MenuPrincipalPage(),
                      ),
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
