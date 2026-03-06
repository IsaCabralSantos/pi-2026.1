import 'package:flutter/material.dart';
import 'package:siderapredict/ui/splash_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sidera Predict",
      theme: ThemeData(useMaterial3: true),
      home: SplashPage(),
    ),
  );
}
