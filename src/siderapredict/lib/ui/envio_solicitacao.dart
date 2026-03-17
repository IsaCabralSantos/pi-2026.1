import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'inspecao_enviada.dart';
import 'theme.dart';

const Color confirmGreen = Color(0xFF12A347);

class EnvioSolicitacaoPage extends StatefulWidget {
  final String requestId;
  final DateTime dateTime;
  final String detectedFault;
  final String confidence;
  final String possibleCause;
  final String recommendedAdjustment;
  final String sectionMachine;
  final String imagePath;

  const EnvioSolicitacaoPage({
    super.key,
    required this.requestId,
    required this.dateTime,
    required this.detectedFault,
    required this.confidence,
    required this.possibleCause,
    required this.recommendedAdjustment,
    required this.sectionMachine,
    required this.imagePath,
  });

  @override
  State<EnvioSolicitacaoPage> createState() => _EnvioSolicitacaoPageState();
}

class _EnvioSolicitacaoPageState extends State<EnvioSolicitacaoPage> {
  final TextEditingController _obsController = TextEditingController();
  final TextEditingController _causeController = TextEditingController();
  final TextEditingController _adjustController = TextEditingController();
  final FocusNode _causeFocus = FocusNode();
  final FocusNode _adjustFocus = FocusNode();
  final FocusNode _obsFocus = FocusNode();

  // sample sections -> machines map; replace or load dynamically as needed
  final Map<String, List<String>> _sectionsMachines = {
    'F1': ['Máquina 23', 'Máquina 24', 'Máquina 25'],
    'F2': ['Máquina 1', 'Máquina 2'],
    'F3': ['Máquina A'],
  };

  String? _selectedSection;
  String? _selectedMachine;

  @override
  void initState() {
    super.initState();
    _causeController.text = widget.possibleCause;
    _adjustController.text = widget.recommendedAdjustment;
    _obsController.text = '';

    // try to prefill section/machine if widget.sectionMachine contains ' - '
    if (widget.sectionMachine.contains(' - ')) {
      final parts = widget.sectionMachine.split(' - ');
      _selectedSection = parts.first;
      _selectedMachine = parts.length > 1 ? parts.sublist(1).join(' - ') : null;
      // ensure machine exists in map
      if (_selectedSection != null && _selectedMachine != null) {
        final list = _sectionsMachines[_selectedSection!];
        if (list == null) {
          _sectionsMachines[_selectedSection!] = [_selectedMachine!];
        } else if (!list.contains(_selectedMachine)) {
          list.add(_selectedMachine!);
        }
      }
    }
  }

  @override
  void dispose() {
    _obsController.dispose();
    _causeController.dispose();
    _adjustController.dispose();
    _causeFocus.dispose();
    _adjustFocus.dispose();
    _obsFocus.dispose();
    super.dispose();
  }

  Widget _infoCard(String title, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: subtleShadows,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: darkTextColor,
                  fontSize: 16,
                  shadows: textShadows,
                ),
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      shadows: textShadows,
                    ),
                  ),
                  TextSpan(
                    text: value,
                    style: const TextStyle(shadows: textShadows),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _labeledEditableField(
    String label,
    TextEditingController controller,
    FocusNode focus,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: subtleShadows,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: darkTextColor,
                  ),
                ),
                const SizedBox(height: 4),
                TextField(
                  controller: controller,
                  focusNode: focus,
                  style: const TextStyle(
                    color: darkTextColor,
                    fontSize: 16,
                    shadows: textShadows,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            padding: const EdgeInsets.all(6),
            constraints: const BoxConstraints(),
            icon: Icon(Icons.edit, color: primaryColor, size: 20),
            onPressed: () => FocusScope.of(context).requestFocus(focus),
          ),
        ],
      ),
    );
  }

  Widget _labeledDropdown<T>(
    String label,
    List<T> items,
    T? value,
    ValueChanged<T?> onChanged,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: subtleShadows,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: darkTextColor,
            ),
          ),
          const SizedBox(height: 4),
          DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              isExpanded: true,
              value: value,
              hint: Text(
                'Selecione $label',
                style: const TextStyle(
                  color: darkTextColor,
                  fontSize: 16,
                  shadows: textShadows,
                ),
              ),
              icon: const Icon(Icons.keyboard_arrow_down),
              dropdownColor: whiteColor,
              style: const TextStyle(
                color: darkTextColor,
                fontSize: 16,
                shadows: textShadows,
              ),
              items: items
                  .map(
                    (it) => DropdownMenuItem<T>(
                      value: it,
                      child: Text(
                        '$it',
                        style: const TextStyle(
                          color: darkTextColor,
                          fontSize: 16,
                          shadows: textShadows,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _compactDropdown<T>(
    String label,
    List<T> items,
    T? value,
    ValueChanged<T?> onChanged,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: subtleShadows,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: darkTextColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              isExpanded: true,
              value: value,
              hint: Text(
                'Selecione',
                style: const TextStyle(
                  color: darkTextColor,
                  fontSize: 14,
                  shadows: textShadows,
                ),
              ),
              icon: const Icon(Icons.keyboard_arrow_down),
              dropdownColor: whiteColor,
              style: const TextStyle(
                color: darkTextColor,
                fontSize: 14,
                shadows: textShadows,
              ),
              items: items
                  .map(
                    (it) => DropdownMenuItem<T>(
                      value: it,
                      child: Text(
                        '$it',
                        style: const TextStyle(
                          color: darkTextColor,
                          fontSize: 14,
                          shadows: textShadows,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  void _showImageOverlay(BuildContext context) {
    if (widget.imagePath.isEmpty) return;
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
                  child: Container(color: Colors.black.withOpacity(0.4)),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.of(ctx).pop(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(widget.imagePath),
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
        title: const Text(
          'Solicitação',
          style: TextStyle(color: Colors.white, shadows: textShadows),
        ),
        centerTitle: true,
        toolbarHeight: 86,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(18)),
        ),
      ),
      body: Builder(
        builder: (context) {
          final keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
          final screenH = MediaQuery.of(context).size.height;
          final imageHeightWhenKeyboard = (screenH * 0.22).clamp(140.0, 220.0);
          if (keyboardOpen) {
            // When keyboard is open allow scrolling to avoid overflow
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                16,
                18,
                16,
                MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _infoCard(
                    'Solicitação ${widget.requestId}',
                    _formatDate(widget.dateTime),
                  ),
                  _infoCard('Falha detectada', widget.detectedFault),
                  _infoCard('Confiabilidade', widget.confidence),
                  const SizedBox(height: 8),
                  Container(
                    height: imageHeightWhenKeyboard,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: subtleShadows,
                    ),
                    child: GestureDetector(
                      onTap: () => _showImageOverlay(context),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            widget.imagePath.isNotEmpty
                                ? Image.file(
                                    File(widget.imagePath),
                                    fit: BoxFit.cover,
                                  )
                                : const Center(child: Text('Nenhuma imagem')),
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
                  const SizedBox(height: 8),
                  _labeledEditableField(
                    'Possível causa',
                    _causeController,
                    _causeFocus,
                  ),
                  _labeledEditableField(
                    'Ajuste Recomendado',
                    _adjustController,
                    _adjustFocus,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _compactDropdown(
                          'Seção',
                          _sectionsMachines.keys.toList(),
                          _selectedSection,
                          (v) {
                            setState(() {
                              _selectedSection = v;
                              final machines = v != null
                                  ? _sectionsMachines[v]!
                                  : <String>[];
                              _selectedMachine = machines.isNotEmpty
                                  ? machines.first
                                  : null;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _compactDropdown(
                          'Máquina',
                          (_selectedSection != null
                              ? _sectionsMachines[_selectedSection!] ?? []
                              : []),
                          _selectedMachine,
                          (v) => setState(() => _selectedMachine = v),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: subtleShadows,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Observações adicionais',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: darkTextColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                focusNode: _obsFocus,
                                controller: _obsController,
                                maxLines: 5,
                                style: const TextStyle(
                                  color: darkTextColor,
                                  fontSize: 16,
                                  shadows: textShadows,
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Escreva aqui...',
                                ),
                              ),
                            ),
                            IconButton(
                              padding: const EdgeInsets.all(6),
                              constraints: const BoxConstraints(),
                              icon: Icon(
                                Icons.edit,
                                color: primaryColor,
                                size: 20,
                              ),
                              onPressed: () => FocusScope.of(
                                context,
                              ).requestFocus(_obsFocus),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: confirmGreen,
                        elevation: 6,
                        shadowColor: blackColor.withOpacity(0.25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        final sectionMachine = _selectedSection != null
                            ? '$_selectedSection - ${_selectedMachine ?? ''}'
                            : (_selectedMachine ?? '');

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => InspecaoEnviadaPage(
                              requestId: widget.requestId,
                              dateTime: widget.dateTime,
                              detectedFault: widget.detectedFault,
                              confidence: widget.confidence,
                              possibleCause: _causeController.text,
                              recommendedAdjustment: _adjustController.text,
                              sectionMachine: sectionMachine,
                              imagePath: widget.imagePath,
                              observations: _obsController.text,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        'CONFIRMAR',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          shadows: textShadows,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          // Default (keyboard closed): fixed layout that fits screen
          return LayoutBuilder(
            builder: (context, constraints) {
              final maxHeight = constraints.maxHeight;
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
                child: SizedBox(
                  height: maxHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Top info cards (take minimal space)
                      _infoCard(
                        'Solicitação ${widget.requestId}',
                        _formatDate(widget.dateTime),
                      ),
                      _infoCard('Falha detectada', widget.detectedFault),
                      _infoCard('Confiabilidade', widget.confidence),

                      // Compact image (square) - restored proportions
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: subtleShadows,
                          ),
                          child: GestureDetector(
                            onTap: () => _showImageOverlay(context),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  widget.imagePath.isNotEmpty
                                      ? Image.file(
                                          File(widget.imagePath),
                                          fit: BoxFit.cover,
                                        )
                                      : const Center(
                                          child: Text('Nenhuma imagem'),
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
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
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
                      ),

                      const SizedBox(height: 8),

                      // Inputs area (fixed total height) - restore original size to keep observations visible
                      SizedBox(
                        height: maxHeight * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Possible cause
                            _labeledEditableField(
                              'Possível causa',
                              _causeController,
                              _causeFocus,
                            ),
                            // Recommended adjustment
                            _labeledEditableField(
                              'Ajuste Recomendado',
                              _adjustController,
                              _adjustFocus,
                            ),
                            // Section + Machine in a row
                            Row(
                              children: [
                                Expanded(
                                  child: _compactDropdown(
                                    'Seção',
                                    _sectionsMachines.keys.toList(),
                                    _selectedSection,
                                    (v) {
                                      setState(() {
                                        _selectedSection = v;
                                        final machines = v != null
                                            ? _sectionsMachines[v]!
                                            : <String>[];
                                        _selectedMachine = machines.isNotEmpty
                                            ? machines.first
                                            : null;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _compactDropdown(
                                    'Máquina',
                                    (_selectedSection != null
                                        ? _sectionsMachines[_selectedSection!] ??
                                              []
                                        : []),
                                    _selectedMachine,
                                    (v) => setState(() => _selectedMachine = v),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            // Observations box (bigger)
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 6.0,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: subtleShadows,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Observações adicionais',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: darkTextColor,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextField(
                                              focusNode: _obsFocus,
                                              controller: _obsController,
                                              maxLines: 5,
                                              style: const TextStyle(
                                                color: darkTextColor,
                                                fontSize: 16,
                                                shadows: textShadows,
                                              ),
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Escreva aqui...',
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            padding: const EdgeInsets.all(6),
                                            constraints: const BoxConstraints(),
                                            icon: Icon(
                                              Icons.edit,
                                              color: primaryColor,
                                              size: 20,
                                            ),
                                            onPressed: () => FocusScope.of(
                                              context,
                                            ).requestFocus(_obsFocus),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Confirm button
                      SizedBox(
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: confirmGreen,
                            elevation: 6,
                            shadowColor: blackColor.withOpacity(0.25),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            final sectionMachine = _selectedSection != null
                                ? '$_selectedSection - ${_selectedMachine ?? ''}'
                                : (_selectedMachine ?? '');

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => InspecaoEnviadaPage(
                                  requestId: widget.requestId,
                                  dateTime: widget.dateTime,
                                  detectedFault: widget.detectedFault,
                                  confidence: widget.confidence,
                                  possibleCause: _causeController.text,
                                  recommendedAdjustment: _adjustController.text,
                                  sectionMachine: sectionMachine,
                                  imagePath: widget.imagePath,
                                  observations: _obsController.text,
                                ),
                              ),
                            );
                          },
                          child: const Text(
                            'CONFIRMAR',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              shadows: textShadows,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  String _formatDate(DateTime dt) {
    final day = _twoDigits(dt.day);
    final month = _twoDigits(dt.month);
    final year = dt.year;
    final hour = _twoDigits(dt.hour);
    final minute = _twoDigits(dt.minute);
    return '$day/$month/$year - $hour:$minute';
  }
}
