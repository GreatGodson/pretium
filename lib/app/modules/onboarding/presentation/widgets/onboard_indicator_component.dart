import 'package:flutter/material.dart';

import '../../../../../core/framework/theme/colors/colors.dart';
import '../../../../../core/framework/theme/spacings/spacings.dart';

class OnboardingIndicator extends StatelessWidget {
  final int currentIndex;
  final int count;

  const OnboardingIndicator({
    super.key,
    required this.currentIndex,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) {
          bool isActive = index == currentIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: Spacings.spacing4),
            width: isActive ? Spacings.spacing24 : Spacings.spacing8,
            height: Spacings.spacing8,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : Colors.grey[400],
              borderRadius: BorderRadius.circular(Spacings.spacing20),
            ),
          );
        },
      ),
    );
  }
}
