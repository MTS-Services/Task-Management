import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/pages/auth/sing_in_screen.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/sing_up_title.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  @override
  void initState() {
    _newPasswordTEController.text = "Abc@123@";
    _confirmPasswordTEController.text = "Abc@123@";
    super.initState();
  }

  final _newPasswordTEController = TextEditingController();
  final _confirmPasswordTEController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: RColors.bgColorColorS,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomAppBar(
                  text: 'Back',
                  images: AssetPath.logoPng,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                SingUpAndTitle(
                  title: 'Set Password',
                  title2: 'Choose a strong password for \nyour account.',
                ),
                SizedBox(height: 60),
                TextFormField(
                  controller: _newPasswordTEController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      size: 20,
                      color: RColors.smallFontColor,
                    ),
                    hintText: "New Password",
                  ),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a new password";
                    } else if (value.length < 8) {
                      return "Password must be at least 8 characters long";
                    } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                      return "Password must contain at least one uppercase letter";
                    } else if (!RegExp(r'(?=.*[0-9])').hasMatch(value)) {
                      return "Password must contain at least one number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 50),
                TextFormField(
                  controller: _confirmPasswordTEController,
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      size: 20,
                      color: RColors.smallFontColor,
                    ),
                    suffixIcon: _buildVisibleIconButton(),
                    hintText: "Confirm Password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please confirm your password";
                    } else if (value != _newPasswordTEController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 120),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                        Get.to(
                          () => SingInScreen(),
                          transition: Transition.rightToLeft,
                          duration: Duration(
                            milliseconds: 750,
                          ),
                        );
                      }
                    },
                    child: Text("Confirm"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVisibleIconButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
      icon: isVisible
          ? Icon(
              Icons.visibility_off,
              color: RColors.smallFontColor,
            )
          : Icon(
              Icons.visibility,
              color: RColors.smallFontColor,
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _confirmPasswordTEController.dispose();
    _newPasswordTEController.dispose();
  }
}
