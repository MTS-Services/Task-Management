import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/widgets/coustom_drop_Down_manu.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/sing_up_title.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {

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
                  onTep: () {},
                ),
                SizedBox(
                  height: 40,
                ),
                SingUpAndTitle(
                  title: 'Welcome Back!',
                  title2: 'Log in your account & Manage \nYour task',
                ),

                SizedBox(height: 60),
                TextFormField(
                  controller: _emailTEController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: RColors.smallFontColor,
                      ),
                      hintText: "E-Mail"),
                ),
                SizedBox(height: 50),
                TextFormField(
                  controller: _passwordTEController,
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: RColors.smallFontColor,
                    ),
                    suffixIcon: _buildVisibleIconButton(),
                    hintText: "Password",

                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("SING UP"),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: RColors.blueButtonColors,
                    ),
                    onPressed: () {},
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
}
