import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/cart/cubit/cubit/cart_state.dart';
import 'package:store/feature/cart/data/cart_data.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  CartData cartData = CartData();

  getAddToCartCubit() async {
    emit(CartLoadingState());
    cartData.addToCard();
    emit(CartSuccessState());
  }

  getAllCartCubit() async {
    emit(CartLoadingState());
    var succes = await cartData.getAllCart();
    emit(CartGetAllSuccess(listCart: succes));
  }

  deleteCartCubit({required String productId}) {
    emit(CartLoadingState());
    cartData.deleteCart(productId: productId);
    emit(CartDelete());
    getAllCartCubit();
  }
}
