import 'package:flutter/material.dart';
import 'package:store/feature/category/view/widget/category_card.dart';
import 'package:store/feature/category/view/widget/category_list.dart';

class CategoryCardBuilder extends StatelessWidget {
  const CategoryCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Image.network(
          'https://www.ntiegypt.sci.eg/moodle/pluginfile.php/1/core_admin/logocompact/300x300/1725271317/NTI%20Logo.png',
          height: 200,
        ),
        ...List.generate(categoryList(context).length, (index) {
          return Card(
            color: Colors.blue,
            elevation: 4.0,
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: CategoryCard(
                  item: categoryList(context)[index],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
