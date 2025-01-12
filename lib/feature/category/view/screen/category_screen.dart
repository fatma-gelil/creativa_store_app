import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/category/cubit/cubit/category_cubit.dart';
import 'package:store/feature/category/cubit/cubit/category_state.dart';
import 'package:store/feature/category/model/category_data.dart';
import 'package:store/feature/category/view/screen/product_details.dart';
import 'package:store/feature/category/view/widget/app_bar.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {required this.endPoint, super.key, required this.title});
  final String endPoint;
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCubit(CategoryData())..getDateCubit(endPoint),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: categoryAppBar(title: title),
        //drawer:categoryList(context),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategorySuccess) {
              return SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: state.category.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ProductDetails(
                              categoryModel: state.category[index]);
                        }));
                      },
                    );
                  },
                ),
              );
            } else if (state is CategoryLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CategoryFail) {
              return Center(
                child: Text(
                  'Error: ${state.error}',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  'No Data Available',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
