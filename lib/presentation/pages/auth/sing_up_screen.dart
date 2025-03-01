import 'package:flutter/material.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Row(
                children: [
                  Icon(Icons.arrow_back_ios),
                  Text("Back")
                ],
              ),
              ),
            ],
          ),
          Text("Sign Up " , style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),)
        ],
      )
    );
  }
}
