import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/core/framework/theme/colors/colors.dart';

import 'app/modules/onboarding/presentation/pages/onboarding_page.dart';
import 'core/framework/navigator/navigator.dart';
import 'injectable.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(
    ProviderScope(
      child: const Pretium(),
    ),
  );
}

class Pretium extends StatelessWidget {
  const Pretium({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigator.navigatorKey,
      title: 'Pretium',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnboardingPage(),
    );
  }
}
