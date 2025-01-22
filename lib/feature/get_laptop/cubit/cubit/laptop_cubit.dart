import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/get_laptop/cubit/cubit/laptop_state.dart';
import 'package:store/feature/get_laptop/model/laptop_data.dart';

class LaptopCubit extends Cubit<LaptopState> {
  LaptopCubit() : super(LaptopInitial());
  final LaptopData laptopData = LaptopData();

  getLaptop()async {
    emit(LaptopLoading());
    var listLap = await LaptopData.getAllData();
    emit(LaptopSuccess(laptopList: listLap));
  }
}
