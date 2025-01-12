import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/authentication/cubit/cubit/auth_state.dart';
import 'package:store/feature/authentication/models/auth_data.dart';

class RegisterCubit extends Cubit<AuthState> {
  //AuthCubit get(context) => BlocProvider.of(context);
  
  RegisterCubit() : super(AuthInitial());
  final AuthData authData = AuthData();
      postDataCubit(
        {required nameData,
        required emailData,
        required phoneData,
        required nationalIdData,
        required genderData,
        required passwordData,
        required tokenData,
        required profileImageData
        }) async {
      var user = await authData.postData(
        name: nameData,
        email: emailData,
        phone: phoneData,
        nationalId: nationalIdData,
        gender: genderData,
        password: passwordData,
        token: tokenData,
        profileImage: "https://th.bing.com/th/id/OIP.yeXRJED4eGbQU-ehe19oHgHaGv?w=238&h=216&c=7&r=0&o=5&dpr=1.3&pid=1.7");
    emit(AuthSuccess(userData: user));
  }
}
