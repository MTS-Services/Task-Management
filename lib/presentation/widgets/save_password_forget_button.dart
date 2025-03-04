import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/pages/auth/email_varification_screen.dart';

class SavePasswordForgetButton extends StatefulWidget {
  final bool isLoginPage;

  const SavePasswordForgetButton({super.key, required this.isLoginPage});

  @override
  State<SavePasswordForgetButton> createState() =>
      _SavePasswordForgetButtonState();
}

class _SavePasswordForgetButtonState extends State<SavePasswordForgetButton> {
  bool isPasswordSaved = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            if (widget.isLoginPage && !isPasswordSaved) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmailVerificationScreen(),
                ),
              );
            }
          },
          child: Text(
            isPasswordSaved
                ? "Save Password"
                : widget.isLoginPage
                    ? "Forget Password"
                    : "Save Password",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: isPasswordSaved
                    ? RColors.switchButtonColor
                    : RColors.blueButtonColors,
                fontSize: 13),
          ),
        ),
        Transform.scale(
          scale: 0.8,
          child: Switch(
            activeColor: RColors.switchButtonColor,
            focusColor: RColors.blueButtonColors,
            value: isPasswordSaved,
            onChanged: (value) {
              setState(() {
                isPasswordSaved = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
