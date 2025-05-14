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

  void _onPageChanged(int index) {
    ref.read(_currentIndex.notifier).state = index;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
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
                  Text(
                    "Skip",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: Spacings.spacing20,
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
                      return Column(
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
                          SizedBox(
                            height: Spacings.spacing24,
                          ),
                          Text(
                            listItems.title,
                            style: TextStyle(
                              fontSize: Spacings.spacing30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: Spacings.spacing8,
                          ),
                          Text(
                            listItems.description,
                            style: TextStyle(
                              fontSize: Spacings.spacing16,
                            ),
                          ),
                        ],
                      );
                    }),
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
