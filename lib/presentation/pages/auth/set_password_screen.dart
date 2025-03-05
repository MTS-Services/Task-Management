import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:maktrack/domain/entities/color.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/sing_up_title.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final _newPasswordTEController = TextEditingController();
  final _confirmPasswordTEController = TextEditingController();
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
                ),
                SizedBox(height: 120),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {

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
