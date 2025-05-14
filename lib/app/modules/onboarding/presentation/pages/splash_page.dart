import 'package:flutter/material.dart';
import 'package:pretium/app/modules/onboarding/presentation/pages/onboarding_page.dart';
import 'package:pretium/core/framework/navigator/navigator.dart';
import 'package:pretium/core/framework/theme/colors/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _scaleAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();

    _init();
  }

  _init() async {
    await Future.delayed(Duration(seconds: 3));
    navigator.pushAndClearStack(page: OnboardingPage());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Image.asset(
            "assets/pngs/pretium.png",
            alignment: Alignment.center,
            // width: 100,
          ),
        ),
      ),
    );
  }
}
