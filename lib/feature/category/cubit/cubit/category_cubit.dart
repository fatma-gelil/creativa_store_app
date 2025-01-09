import 'package:bloc/bloc.dart';
import 'package:store/feature/category/cubit/cubit/category_state.dart';
import 'package:store/feature/category/model/category_data.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.category) : super(CategoryInitial());
  final CategoryData category;
 
  getDateCubit(String endpoint) async {
    emit(CategoryLoading());
    var categories = await category.getData(endpoint: endpoint);
    emit(CategorySuccess(category: categories));
  }
}
