import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFB71C1C);
const Color paletteRed = Color(0xFF8E1717);
const Color darkTextColor = Color(0xFF1E1E1E);
const Color blackColor = Color(0xFF000000);
const Color whiteColor = Color(0xFFFFFFFF);
const Color backgroundLight = Color(0xFFF0F2F5);
const Color backgroundLighter = Color(0xFFF0F2F5);

// Shadows / elevation used across the app to create a subtle 3D look
const List<BoxShadow> subtleShadows = [
  BoxShadow(
    color: Color(0x1F000000), // ~12% black
    blurRadius: 8,
    offset: Offset(0, 4),
  ),
  BoxShadow(
    color: Color(0x0A000000), // ~4% black
    blurRadius: 2,
    offset: Offset(0, 1),
  ),
];

const List<Shadow> textShadows = [
  Shadow(
    color: Color(0x66000000), // ~40% black
    offset: Offset(0, 1),
    blurRadius: 2,
  ),
];
