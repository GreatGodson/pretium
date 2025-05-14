import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/app/shared/helpers/form_validator.dart';
import 'package:pretium/app/shared/presentation/widgets/components/button_component.dart';
import 'package:pretium/app/shared/presentation/widgets/components/textfield_component.dart';
import 'package:pretium/core/framework/theme/colors/colors.dart';

import '../../../../../core/framework/navigator/navigator.dart';
import '../../../../../core/framework/theme/spacings/spacings.dart';

class SignupPage extends ConsumerWidget {
  SignupPage({super.key});

  final _isRememberMe = StateProvider((ref) => false);
  final _formKey = GlobalKey<FormState>();
  final _isPasswordVisible = StateProvider((ref) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formFields = [
      TextFieldComponent(
        hint: "First Name",
        prefix: Icon(Icons.perm_identity),
        validator: (val) => FormValidator.isNameValid(val),
      ),
      SizedBox(height: Spacings.spacing24),
      TextFieldComponent(
        hint: "Last Name",
        prefix: Icon(Icons.perm_identity),
        validator: (val) => FormValidator.isNameValid(val),
      ),
      SizedBox(height: Spacings.spacing24),
      TextFieldComponent(
        hint: "Email",
        prefix: Icon(Icons.email_outlined),
        validator: (val) => FormValidator.isEmailValid(val),
      ),
      SizedBox(height: Spacings.spacing24),
      TextFieldComponent(
        obscureText: !ref.watch(_isPasswordVisible),
        hint: "Password",
        prefix: Icon(Icons.lock_outline),
        validator: (val) => FormValidator.isPasswordValid(val),
        suffix: InkWell(
          onTap: () {
            ref.read(_isPasswordVisible.notifier).state =
                !ref.read(_isPasswordVisible);
          },
          child: ref.watch(_isPasswordVisible)
              ? Icon(Icons.visibility)
              : Icon(Icons.visibility_off),
        ),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Spacings.spacing24),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      navigator.pop();
                    },
                    child: Icon(Icons.arrow_back_sharp),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: Spacings.spacing40),
                        Row(
                          children: [
                            Text(
                              "Create Account",
                              style: TextStyle(
                                fontSize: Spacings.spacing30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.3),
                        SizedBox(height: Spacings.spacing12),
                        Row(
                          children: [
                            Text(
                              "Simplify your crypto payments with us",
                              style: TextStyle(
                                fontSize: Spacings.spacing16,
                              ),
                            ),
                          ],
                        )
                            .animate(delay: 200.ms)
                            .fadeIn(duration: 500.ms)
                            .slideY(begin: 0.3),
                        SizedBox(height: Spacings.spacing60),

                        // Animate form fields with staggered effects
                        ...formFields
                            .animate(interval: 100.ms)
                            .fadeIn(duration: 400.ms)
                            .slideY(begin: 0.3),

                        SizedBox(height: Spacings.spacing40),
                        Row(
                          children: [
                            Checkbox.adaptive(
                              activeColor: AppColors.primary,
                              value: ref.watch(_isRememberMe),
                              onChanged: (val) {
                                ref.read(_isRememberMe.notifier).state =
                                    !ref.read(_isRememberMe);
                              },
                            ),
                            Text(
                              "Accept Terms and Conditions",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: Spacings.spacing16,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        )
                            .animate(delay: 600.ms)
                            .fadeIn(duration: 400.ms)
                            .slideY(begin: 0.3),
                        SizedBox(height: Spacings.spacing20),
                        ButtonComponent(
                          text: "Create Account",
                          onPressed: () {
                            _formKey.currentState?.validate();
                          },
                          expanded: true,
                        )
                            .animate(delay: 700.ms)
                            .fadeIn(duration: 400.ms)
                            .slideY(begin: 0.3),
                        SizedBox(height: Spacings.spacing40),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account?",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(text: "    "),
                              TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                    fontSize: Spacings.spacing14,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      navigator.pop();
                                    }),
                            ],
                          ),
                        )
                            .animate(delay: 800.ms)
                            .fadeIn(duration: 400.ms)
                            .slideY(begin: 0.3),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
