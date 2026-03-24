import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'core/theme/theme.dart';

final _statusBarStyle = SystemUiOverlayStyle(
  statusBarColor: primaryColor,
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.dark,
);

void main() {
  SystemChrome.setSystemUIOverlayStyle(_statusBarStyle);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sidera Predict',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: _statusBarStyle,
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
      ),
      builder: (context, child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: _statusBarStyle,
          child: child ?? const SizedBox.shrink(),
        );
      },
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppPages.onGenerateRoute,
    ),
  );
}
