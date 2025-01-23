import 'package:flutter/material.dart';
import 'package:store/feature/Laptop/view/laptop_screen.dart';
import 'package:store/feature/category/view/widget/category_card.dart';
import 'package:store/feature/category/view/widget/category_list.dart';

class CategoryCardBuilder extends StatelessWidget {
  const CategoryCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                'https://www.ntiegypt.sci.eg/moodle/pluginfile.php/1/core_admin/logocompact/300x300/1725271317/NTI%20Logo.png',
                height: 200,
              ),
              SizedBox(
                height: 30,
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
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LaptopScreen(),
                    ),
                  );
                },
                child: Card(
                  color: Colors.blue,
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('LapTops',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),))),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
