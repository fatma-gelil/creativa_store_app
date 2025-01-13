import 'package:flutter/material.dart';
import 'package:store/feature/category/view/screen/category_screen.dart';
import 'package:store/feature/category/view/screen/splash_screen.dart';
import 'package:store/feature/category/view/widget/category_card.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:CategoryScreen(endPoint: 'jewelery', title: 'jewelery')
      //SplashScreen()
      //CategoryScreen()
      //RegisterScreen()
     
    );
  }
}