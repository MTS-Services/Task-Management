import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/pages/auth/otp_varification_screen.dart';


import '../../widgets/custom_app_bar.dart';
import '../../widgets/sing_up_title.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  @override
  void initState() {
    _emailTEController.text ="arifin50@gmail.com";
    super.initState();
  }
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    } else if (!GetUtils.isEmail(value)) {
                      return "Invalid Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 220,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_globalKey.currentState!.validate()){
                        Get.to(
                              () => OtpVerificationScreen(),
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 750),
                        );
                      }
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

  @override
  void dispose() {

    _emailTEController.dispose();
    super.dispose();
  }
}
