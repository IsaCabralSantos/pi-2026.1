import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ZoomableImageOverlay {
  const ZoomableImageOverlay._();

  static void show(
    BuildContext context, {
    required ImageProvider imageProvider,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Imagem',
      pageBuilder: (ctx, a1, a2) {
        return GestureDetector(
          onTap: () => Navigator.of(ctx).pop(),
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                  child: Container(color: Colors.black.withValues(alpha: 0.4)),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.of(ctx).pop(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        image: imageProvider,
                        width: MediaQuery.of(ctx).size.width * 0.8,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      transitionBuilder: (ctx, a1, a2, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: a1, curve: Curves.easeOut),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
    );
  }
}
