import 'package:flutter/material.dart';

import 'ui/common/app_theme.dart';
import 'ui/splash/splash_view.dart';

void main() {
  runApp(const CaiaApp());
}

class CaiaApp extends StatelessWidget {
  const CaiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAIA Cosmetics',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.build(),
      home: const SplashGate(),
    );
  }
}
