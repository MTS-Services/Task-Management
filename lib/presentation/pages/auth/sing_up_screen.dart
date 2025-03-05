import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/pages/auth/sing_in_screen.dart';
import 'package:maktrack/presentation/widgets/coustom_drop_Down_manu.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/save_password_forget_button.dart';
import '../../widgets/sing_up_title.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final _userNameTEController = TextEditingController();
  final _emailTEController = TextEditingController();
  final _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool isVisible = false;

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
                SizedBox(
                  height: 10,
                ),
                CustomAppBar(
                  text: 'Back',
                  images: AssetPath.logoPng,
                  onTep: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                SingUpAndTitle(
                  title: 'Sing Up',
                  title2: 'Log in your account & Manage \nYour task',
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _userNameTEController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline_outlined,
                        size: 20,
                        color: RColors.smallFontColor,
                      ),
                      hintText: "UserName"),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _emailTEController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        size: 20,
                        color: RColors.smallFontColor,
                      ),
                      hintText: "E-Mail"),
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _passwordTEController,
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      size: 20,
                      color: RColors.smallFontColor,
                    ),

                    suffixIcon: IconButton(
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
                    ),
                    hintText: "password"),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("SING UP"),
                ),
              ),
              SizedBox(height: 15),

                CustomDropDownMenu(),
                SizedBox(
                  height: 30,
                ),
                SavePasswordForgetButton(
                  isLoginPage: false,
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingInScreen(),
                        ),
                      );
                    },
                    child: Text("SING UP"),
                  ),
                ),
                SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: RColors.blueButtonColors,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingInScreen(),
                        ),
                      );
                    },
                    child: Text("Already have an account? LOG IN "),
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
    _passwordTEController.dispose();
    _emailTEController.dispose();
    _userNameTEController.dispose();
  }
}
