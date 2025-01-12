import 'package:flutter/material.dart';
import 'package:store/feature/authentication/screen/auth.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Auth()
      //SplashScreen()
    );
  }
}