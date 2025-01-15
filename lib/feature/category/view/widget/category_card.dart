import 'package:flutter/material.dart';
import 'package:store/feature/category/model/category_card_model.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.item});
  final CategoryCardModel item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onTap,
      child: Text(item.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
    );
  }
}