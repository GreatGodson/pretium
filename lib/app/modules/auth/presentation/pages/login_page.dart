import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/app/modules/auth/presentation/pages/signup_page.dart';
import 'package:pretium/app/shared/helpers/form_validator.dart';
import 'package:pretium/app/shared/presentation/widgets/components/button_component.dart';
import 'package:pretium/app/shared/presentation/widgets/components/textfield_component.dart';
import 'package:pretium/core/framework/navigator/navigator.dart';
import 'package:pretium/core/framework/theme/colors/colors.dart';

import '../../../../../core/framework/theme/spacings/spacings.dart';
import 'forgot_password_page.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final _isRememberMe = StateProvider((ref) => false);
  final _formKey = GlobalKey<FormState>();
  final _isPasswordVisible = StateProvider((ref) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Spacings.spacing24),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: Spacings.spacing40),

                  // Logo Icon
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Spacings.spacing14,
                      horizontal: Spacings.spacing14,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(Spacings.spacing12),
                    ),
                    child: Icon(
                      Icons.account_balance_wallet,
                      color: AppColors.primary,
                      size: 30,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 500.ms)
                      .slide(begin: Offset(0, -0.2)),

                  SizedBox(height: Spacings.spacing24),

                  // Welcome Text
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: Spacings.spacing30,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 500.ms, delay: 200.ms)
                      .slide(begin: Offset(0, -0.1)),

                  SizedBox(height: Spacings.spacing12),

                  Text(
                    "Sign in to continue",
                    style: TextStyle(fontSize: Spacings.spacing16),
                  )
                      .animate()
                      .fadeIn(duration: 500.ms, delay: 400.ms)
                      .slide(begin: Offset(0, -0.1)),

                  SizedBox(height: Spacings.spacing60),

                  // Email Field
                  TextFieldComponent(
                    hint: "Email",
                    prefix: Icon(Icons.email_outlined),
                    validator: (val) => FormValidator.isEmailValid(val),
                  )
                      .animate()
                      .fadeIn(duration: 400.ms, delay: 600.ms)
                      .slideX(begin: -0.5),

                  SizedBox(height: Spacings.spacing24),

                  // Password Field
                  TextFieldComponent(
                    obscureText: !ref.watch(_isPasswordVisible),
                    hint: "Password",
                    prefix: Icon(Icons.lock_outline),
                    validator: (val) => FormValidator.isEmpty(val),
                    suffix: InkWell(
                      onTap: () {
                        ref.read(_isPasswordVisible.notifier).state =
                            !ref.read(_isPasswordVisible);
                      },
                      child: ref.watch(_isPasswordVisible)
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 400.ms, delay: 800.ms)
                      .slideX(begin: 0.5),

                  SizedBox(height: Spacings.spacing40),

                  // Remember me + Forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                          Text("Remember me"),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          navigator.push(
                            page: ForgotPasswordPage(),
                          );
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontSize: Spacings.spacing14,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ).animate().fadeIn(delay: 1.seconds),

                  SizedBox(height: Spacings.spacing20),

                  // Login Button
                  ButtonComponent(
                    text: "Login",
                    onPressed: () {
                      _formKey.currentState?.validate();
                    },
                    expanded: true,
                  )
                      .animate()
                      .fadeIn(delay: 1.2.seconds)
                      .scale(begin: Offset(0.9, 0.9)),

                  SizedBox(height: Spacings.spacing40),

                  // Sign up
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(text: "    "),
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            fontSize: Spacings.spacing14,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navigator.push(page: SignupPage());
                            },
                        )
                      ],
                    ),
                  ).animate().fadeIn(delay: 1.4.seconds).slideY(begin: 0.2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
