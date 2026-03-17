import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:siderapredict/ui/splash_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFDE1212),
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sidera Predict",
      theme: ThemeData(useMaterial3: true),
      home: SplashPage(),
    ),
  );
}
