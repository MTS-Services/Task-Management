import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:maktrack/domain/entities/color.dart';

import '../../widgets/custom_app_bar.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Form(
          key: _globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                text: 'Back',
                images: AssetPath.logoPng,
                onTep: () {},
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Sign Up ",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Log in your account & manage \nyour task",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _userNameTEController,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outline_outlined,
                      color: RColors.smallFontColor,
                    ),
                    hintText: "UserName"),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailTEController,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: RColors.smallFontColor,
                    ),
                    hintText: "E-mail"),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _passwordTEController,
                obscureText: isVisible,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: RColors.blackButtonColor1,
                  ),
                  onPressed: () {},
                  child: Text("Already have an account? LOG IN "),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
