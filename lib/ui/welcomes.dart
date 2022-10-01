import 'package:craftman/util/rounded_b.dart';
import 'package:flutter/material.dart';

class WelcomeS extends StatefulWidget {
  const WelcomeS({Key? key}) : super(key: key);

  @override
  State<WelcomeS> createState() => _WelcomeSState();
}

class _WelcomeSState extends State<WelcomeS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF262b50),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //welcome screen logo
                const Hero(
                  tag: 'logo',
                  child: Image(
                    image: AssetImage('images/Craftman.png'),
                    width: 600.0,
                    height: 400.0,
                  ),
                ),
                //signuppage button

                Roundedbutton(
                  text: 'signup',
                  onPressed: (() {
                    Navigator.pushNamed(context, 'signup');
                  }),
                ),

                //loginpage button
                Roundedbutton(
                    text: 'Login',
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
