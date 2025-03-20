import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/firebase_auth_implement/firebase_auth_services.dart';
import 'package:maktrack/presentation/pages/auth/sing_up_screen.dart';
import 'package:maktrack/presentation/pages/auth/super_admin_panel.dart';
import 'package:maktrack/presentation/pages/screen/DashBoard/dash_board.dart';
import 'package:maktrack/presentation/pages/screen/onboarding/onboarding_screen.dart';
import 'package:maktrack/presentation/widgets/save_password_forget_button.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/sing_up_title.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final _emailTEController = TextEditingController();
  final _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
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
                      Get.to(OnboardingScreen());
                    },
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
                  SizedBox(height: 50),
                  TextFormField(
                    controller: _passwordTEController,
                    obscureText: isVisible,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        size: 20,
                        color: RColors.smallFontColor,
                      ),
                      suffixIcon: _buildVisibleIconButton(),
                      hintText: "Password",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
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
                  SizedBox(
                    height: 40,
                  ),
                  SavePasswordForgetButton(
                    isLoginPage: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(height: 60),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          sigIn();
                        }
                      },
                      child: Text("LOGIN"),
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
                        Get.to(
                          () => SingUpScreen(),
                          transition: Transition.rightToLeft,
                          duration: Duration(
                            milliseconds: 750,
                          ),
                        );
                      },
                      child: Text("Don't have an account? SIGN UP "),
                    ),
                  ),
                ],
              ),
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
  }

  void sigIn() async {
  String email = _emailTEController.text;
  String password = _passwordTEController.text;

  try {
    // Attempt to sign in with email and password
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;

    if (user != null) {
      String uid = user.uid;

      // ✅ Check if user is in "users" section (Approved users)
      DatabaseReference approvedUserRef =
          FirebaseDatabase.instance.ref("users/$uid");
      DataSnapshot approvedUserSnapshot = await approvedUserRef.get();

      if (approvedUserSnapshot.exists &&
          approvedUserSnapshot.child("status").value == "approved") {
        print("User is approved. Logging in...");
        Get.to(() => DashBoard(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 750));
        return;
      }

      // ❌ If not approved, check "pending_users"
      DatabaseReference pendingUserRef =
          FirebaseDatabase.instance.ref("pending_users/$uid");
      DataSnapshot pendingUserSnapshot = await pendingUserRef.get();

      if (pendingUserSnapshot.exists) {
        print("User is still pending approval. Logging out.");
        await FirebaseAuth.instance.signOut();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: RColors.snackBarColorR,
            content: Text(
              "Your account is not approved yet. Please wait for admin approval.",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white, fontSize: 12),
            ),
          ),
        );
        return;
      }

      // ✅ Check if the user is a Super Admin
      DatabaseReference superAdminRef =
          FirebaseDatabase.instance.ref("super_admins/$uid");
      DataSnapshot superAdminSnapshot = await superAdminRef.get();

      if (superAdminSnapshot.exists) {
        print("User is a Super Admin. Redirecting...");
        Get.to(() => SuperAdminPanel(),
            transition: Transition.rightToLeft,
            duration: Duration(milliseconds: 750));
        return;
      }

      // ❌ If user not found in any section, show error
      print("User not found in approved users, pending_users, or super_admins.");
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: RColors.snackBarColorR,
          content: Text(
            "Invalid email or password. Please try again.",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white, fontSize: 12),
          ),
        ),
      );
    }
  } catch (e) {
    print("Error: $e"); // Log the error to the console
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: RColors.snackBarColorR,
        content: Text(
          "An error occurred: $e",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}

}
