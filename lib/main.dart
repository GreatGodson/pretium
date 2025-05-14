import 'package:flutter/material.dart';

import 'app/modules/onboarding/presentation/pages/onboarding_page.dart';

void main() {
  runApp(const Pretium());
}

class Pretium extends StatelessWidget {
  const Pretium({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pretium',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnboardingPage(),
    );
  }
}



