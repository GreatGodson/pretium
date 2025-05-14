import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/framework/navigator/navigator.dart';
import '../../../../../core/framework/theme/spacings/spacings.dart';
import '../../../../shared/helpers/form_validator.dart';
import '../../../../shared/presentation/widgets/components/button_component.dart';
import '../../../../shared/presentation/widgets/components/textfield_component.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Spacings.spacing40),

                        Text(
                          "Forgot Password",
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
                          "Enter your email to receive a password reset code",
                          style: TextStyle(fontSize: Spacings.spacing16),
                        )
                            .animate()
                            .fadeIn(duration: 500.ms, delay: 400.ms)
                            .slide(begin: Offset(0, -0.1)),

                        SizedBox(height: Spacings.spacing40),

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

                        SizedBox(height: Spacings.spacing20),

                        ButtonComponent(
                          text: "Send Reset Code",
                          onPressed: () {
                            _formKey.currentState?.validate();
                          },
                          expanded: true,
                        )
                            .animate()
                            .fadeIn(delay: 1.2.seconds)
                            .scale(begin: Offset(0.9, 0.9)),

                        SizedBox(height: Spacings.spacing40),
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
