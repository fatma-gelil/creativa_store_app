import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/fav/cubit/favourite_state.dart';
import 'package:store/feature/fav/data/data.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  static FavouriteCubit get(context) => BlocProvider.of(context);
  FavouriteCubit() : super(FavouriteInitial());
  final FavData favData = FavData();

  addFavCubit({required String productId}) {
    emit(FavouriteLoad());
    FavData.addFav();
    emit(FavouriteSuccess());
  }

  getAllFav() async {
    emit(FavouriteLoad());
    var success = await FavData.getAllFav();
    emit(GetFavouriteSuccess(listFav: success));
  }

  deleteAllFav({required String productId}) {
    emit(FavouriteLoad());
    FavData.deleteAllFav(productId: productId);
    getAllFav();
  }
}
