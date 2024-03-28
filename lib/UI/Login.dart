import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginSignUpState();
}

class _LoginSignUpState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(

                )
              ),
            ),
            const SizedBox(height: 20,),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(

                )
              ),
            ),

            const SizedBox(height: 20,),
            GestureDetector(
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
