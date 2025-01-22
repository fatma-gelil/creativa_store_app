import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/cart/cubit/cubit/cart_cubit.dart';
import 'package:store/feature/get_laptop/cubit/cubit/laptop_cubit.dart';
import 'package:store/feature/get_laptop/cubit/cubit/laptop_state.dart';

class LaptopScreen extends StatelessWidget {
  const LaptopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LaptopCubit()..getLaptop(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Laptops",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: BlocBuilder<LaptopCubit, LaptopState>(
          builder: (context, state) {
            if (state is LaptopLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LaptopSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: state.laptopList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final laptop = state.laptopList[index];

                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              laptop.image,
                              fit: BoxFit.cover,
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              laptop.description,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "\$${laptop.price}",
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 16),
                              ),
                              IconButton(
                                  onPressed: () {
                                    CartCubit.get(context).getAddToCartCubit();
                                  },
                                  icon: Icon(Icons.add_shopping_cart_sharp))
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(child: Text("Fetching laptops..."));
          },
        ),
      ),
    );
  }
}
