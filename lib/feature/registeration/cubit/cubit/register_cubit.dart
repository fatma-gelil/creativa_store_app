import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:store/feature/registeration/cubit/cubit/register_state.dart';
import 'package:store/feature/registeration/model/register_model.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final AuthData authData = AuthData();
  postDataCubit({
    required nameData,
    required emailData,
    required phoneData,
    required nationalIdData,
    required genderData,
    required passwordData,
    required tokenData,
    //required profileImageData
  }) async {
    var user = await authData.postData(
        name: nameData,
        email: emailData,
        phone: phoneData,
        nationalId: nationalIdData,
        gender: genderData,
        password: passwordData,
        token: tokenData,
        profileImage:userImage);
    emit(RegisterSuccess(userData: user));
  }

  ImagePicker picker = ImagePicker();
  File? image;
  String? userImage;

  Future<void> addImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      Uint8List bytes = File(image!.path).readAsBytesSync();
      userImage = base64Encode(bytes);
      if (kDebugMode) {
        print('images = $userImage');
      }
      emit(ChooseImage());
    } else {
      if (kDebugMode) {
        print('no image selected');
      }
    }
  }
}
