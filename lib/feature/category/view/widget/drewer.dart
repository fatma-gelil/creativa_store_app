import 'package:flutter/material.dart';
import 'package:store/feature/category/view/widget/category_card.dart';
import 'package:store/feature/category/view/widget/category_list.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.network(
              'https://www.ntiegypt.sci.eg/moodle/pluginfile.php/1/core_admin/logocompact/300x300/1725271317/NTI%20Logo.png',
              height: 200,
            ),
          ),
          Column(
            children: List.generate(categoryList(context).length, (index) {
              return Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Card(
                  color: Colors.blue,
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: CategoryCard(
                        item: categoryList(context)[index],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
