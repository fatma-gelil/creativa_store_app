import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/fav/cubit/favourite_cubit.dart';
import 'package:store/feature/fav/cubit/favourite_state.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteCubit()..getAllFav(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text(
            'Favourites',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
        body: BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            if (state is GetFavouriteSuccess) {
              return ListView.builder(
                itemCount: state.listFav.length,
                itemBuilder: (context, index) => 
                ListTile(
                  leading: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(state.listFav[index].image),
                  ),
                  title: Text(
                    state.listFav[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    state.listFav[index].description,
                    maxLines: 3,
                  ),
                  trailing: IconButton(
                    icon:Icon(Icons.delete), onPressed: () {
                      FavouriteCubit.get(context).deleteAllFav(
                                productId: state.listFav[index].id);
                    }  ,
                   ),
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
