import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/app/modules/auth/presentation/pages/login_page.dart';
import 'package:pretium/app/shared/presentation/widgets/components/button_component.dart';
import 'package:pretium/core/framework/navigator/navigator.dart';

import '../../../../../core/framework/theme/colors/colors.dart';
import '../../../../../core/framework/theme/spacings/spacings.dart';
import '../../data/onoarding_data_model.dart';
import '../widgets/onboard_indicator_component.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  final List<OnboardingModel> _items = OnboardingModel.items;

  late PageController _pageController;
  final _currentIndex = StateProvider((ref) => 0);
  Timer? _timer;

  void _onPageChanged(int index) {
    ref.read(_currentIndex.notifier).state = index;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (ref.read(_currentIndex) < _items.length - 1) {
        _pageController.animateToPage(ref.read(_currentIndex) + 1,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacings.spacing24),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      navigator.pushAndClearStack(
                        page: LoginPage(),
                      );
                    },
                    child: Text(
                      "Skip",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: Spacings.spacing20,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final listItems = _items[index];
                    final isCurrent = ref.watch(_currentIndex) == index;

                    return AnimatedOpacity(
                      duration: Duration(milliseconds: 500),
                      opacity: isCurrent ? 1.0 : 0.0,
                      child: AnimatedSlide(
                        offset: isCurrent ? Offset(0, 0) : Offset(0.1, 0),
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.secondary,
                              radius: Spacings.spacing60,
                              child: Icon(
                                listItems.iconData,
                                size: Spacings.spacing50,
                                color: AppColors.primary,
                              ),
                            ),
                            SizedBox(height: Spacings.spacing24),
                            Text(
                              listItems.title,
                              style: TextStyle(
                                fontSize: Spacings.spacing30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: Spacings.spacing8),
                            Text(
                              listItems.description,
                              style: TextStyle(
                                fontSize: Spacings.spacing16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              OnboardingIndicator(
                currentIndex: ref.watch(_currentIndex),
                count: 3,
              ),
              SizedBox(
                height: Spacings.spacing26,
              ),
              ButtonComponent(
                text: ref.watch(_currentIndex) < 2 ? "Next" : "Get Started",
                onPressed: () {
                  if (ref.watch(_currentIndex) < 2) {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                  if (ref.watch(_currentIndex) == 2) {
                    navigator.pushAndClearStack(
                      page: LoginPage(),
                    );
                  }
                },
                expanded: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
