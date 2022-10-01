import 'package:craftman/ui/login_s.dart';
import 'package:craftman/ui/screen_nav.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:craftman/ui/welcomes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.remove();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'craftman',
    home: const WelcomeS(),
    //page route
    initialRoute: 'WelcomeS()',
    routes: {
      'Welcome': (context) => const WelcomeS(),
      'login': (context) => const Login(),
      'home': (context) => const Home(),
    },
  ));
}
