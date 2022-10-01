import 'package:craftman/util/rounded_b.dart';
import 'package:craftman/util/textfieldkfile.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool loading = false;

  @override
  void initState() {
    super.initState();

    emailcontroller.addListener(onListen);
    passwordcontroller.addListener(onListen);
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    emailcontroller.removeListener(onListen);
    passwordcontroller.dispose();
    passwordcontroller.removeListener(onListen);

    super.dispose();
  }

  void onListen() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF262b50),
      //loading progress
      body: ModalProgressHUD(
        inAsyncCall: loading,
        color: const Color(0xFFe45a15),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(children: [
            Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //signup logo
                  const Hero(
                    tag: 'logo',
                    child: Image(
                      image: AssetImage('images/Craftman.png'),
                      width: 500.0,
                      height: 300.0,
                    ),
                  ),
                  //email field
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: emailcontroller,
                    autofillHints: const [AutofillHints.email],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter a valid email!';
                      }
                      return null;
                    },
                    onChanged: (value) => email = value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: ktextfield.copyWith(
                      hintText: 'enter your email',
                      labelText: 'Email',
                      suffixIcon: emailcontroller.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                              onPressed: () {
                                emailcontroller.clear();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Color(0xFF9AB4C2),
                              ),
                            ),
                      prefixIcon: const Icon(
                        Icons.mail,
                        color: Color(0xFF9AB4C2),
                      ),
                    ),
                  ),
                  //space between emial and password field
                  const SizedBox(
                    height: 10.0,
                  ),
                  //password field
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter a valid pasword!';
                      }
                      return null;
                    },
                    onChanged: (value) => password = value,
                    controller: passwordcontroller,
                    obscureText: true,
                    decoration: ktextfield.copyWith(
                      hintText: 'enter your password',
                      labelText: 'Password',
                      suffixIcon: passwordcontroller.text.isEmpty
                          ? Container(width: 0)
                          : IconButton(
                              onPressed: () {
                                passwordcontroller.clear();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Color(0xFF9AB4C2),
                              ),
                            ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xFF9AB4C2),
                      ),
                    ),
                  ),

                  //space between form field and button
                  const SizedBox(
                    height: 10.0,
                  ),
                  //signup button
                  Roundedbutton(
                      text: 'signup',
                      onPressed: () {
                        //create email and password
                        _submit();
                      }),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  //summit button function
  void _submit() async {
    setState(() {
      //loading progress activate
      loading = true;
    });
    if (_formkey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('processing data'),
        ),
      );
    }
    _formkey.currentState!.save();
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      (e);
    }
    setState(() {
      Navigator.pushNamed(context, '/home');
      setState(() {
        //loading progress deactivate
        loading = false;
      });
    });
  }
}
