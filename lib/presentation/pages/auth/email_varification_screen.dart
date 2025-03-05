import 'dart:async';
import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/pages/auth/otp_varification_screen.dart';
import 'package:maktrack/presentation/pages/auth/set_password_screen.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/sing_up_title.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _emailTEController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool isButtonDisabled = false;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                CustomAppBar(
                  text: 'Back',
                  images: AssetPath.logoPng,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
                SingUpAndTitle(
                  title: 'Email Verification ',
                  title2:
                      "Enter your email to receive an OTP and reset your password.",
                ),
                const SizedBox(height: 100),
                TextFormField(
                  controller: _emailTEController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.mail_outline,
                      size: 20,
                      color: RColors.smallFontColor,
                    ),
                    hintText: "E-Mail",
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpVerificationScreen(),
                        ),
                      );
                    },
                    child: const Text("Verify OTP"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dispose() {

    _emailTEController.dispose();
    super.dispose();
  }
}
