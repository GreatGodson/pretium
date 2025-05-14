import 'package:flutter/material.dart';

class OnboardingModel {
  OnboardingModel({
    required this.iconData,
    required this.title,
    required this.description,
  });

  final IconData iconData;
  final String title;
  final String description;

  static final List<OnboardingModel> items = [
    OnboardingModel(
      iconData: Icons.credit_card_rounded,
      title: "Direct Pay",
      description: "Pay with crypto across Africa effortlessly",
    ),
    OnboardingModel(
      iconData: Icons.account_balance_wallet,
      title: "Accept Payments",
      description: "Accept stablecoin payments hassle-free",
    ),
    OnboardingModel(
      iconData: Icons.screen_lock_landscape,
      title: "Pay Bills",
      description: "Pay for utility services and earn rewards",
    ),
  ];
}
