import 'package:flutter/material.dart';
import 'package:store/feature/category/view/widget/build_category_card.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title:const Text('products'),centerTitle: true,backgroundColor: Colors.blue,),
      backgroundColor: Colors.white,
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 40),
        child: CategoryCardBuilder(),
      ),
    );
  }
}