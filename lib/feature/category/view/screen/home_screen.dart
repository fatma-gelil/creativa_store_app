import 'package:flutter/material.dart';
import 'package:store/feature/category/view/widget/app_bar.dart';
import 'package:store/feature/category/view/widget/bottom_nav_bar.dart';
import 'package:store/feature/category/view/widget/build_category_card.dart';
import 'package:store/feature/category/view/widget/drewer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:categoryAppBar(title: 'Store'),
      drawer: MyDrawer(),
      backgroundColor: Colors.white,
      body: 
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 40),
        child: CategoryCardBuilder(),
      ),
      bottomNavigationBar:CustomBottomNavBar() ,
    );
  }
}

