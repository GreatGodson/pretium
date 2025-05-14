import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/app/modules/auth/presentation/pages/signup_page.dart';
import 'package:pretium/app/shared/helpers/form_validator.dart';
import 'package:pretium/app/shared/presentation/widgets/components/button_component.dart';
import 'package:pretium/app/shared/presentation/widgets/components/textfield_component.dart';
import 'package:pretium/core/framework/navigator/navigator.dart';
import 'package:pretium/core/framework/theme/colors/colors.dart';

import '../../../../../core/framework/theme/spacings/spacings.dart';

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
                  SizedBox(
                    height: Spacings.spacing40,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Spacings.spacing14,
                      horizontal: Spacings.spacing14,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(
                        Spacings.spacing12,
                      ),
                    ),
                    child: Icon(
                      Icons.account_balance_wallet,
                      color: AppColors.primary,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: Spacings.spacing24,
                  ),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: Spacings.spacing30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: Spacings.spacing12,
                  ),
                  Text(
                    "Sign in to continue",
                    style: TextStyle(
                      fontSize: Spacings.spacing16,
                    ),
                  ),
                  SizedBox(
                    height: Spacings.spacing60,
                  ),
                  TextFieldComponent(
                    hint: "Email",
                    prefix: Icon(Icons.email_outlined),
                    validator: (val) {
                      return FormValidator.isEmailValid(val);
                    },
                  ),
                  SizedBox(
                    height: Spacings.spacing24,
                  ),
                  TextFieldComponent(
                    obscureText: !ref.watch(_isPasswordVisible),
                    hint: "Password",
                    prefix: Icon(Icons.lock_outline),
                    validator: (val) {
                      return FormValidator.isEmpty(val);
                    },
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
                  SizedBox(
                    height: Spacings.spacing40,
                  ),
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
                          Text(
                            "Remember me",
                          ),
                        ],
                      ),
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontSize: Spacings.spacing14,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Spacings.spacing20,
                  ),
                  ButtonComponent(
                    text: "Login",
                    onPressed: () {
                      _formKey.currentState?.validate();
                    },
                    expanded: true,
                  ),
                  SizedBox(
                    height: Spacings.spacing40,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(color: Colors.black)),
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
                              navigator.push(
                                page: SignupPage(),
                              );
                            },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
