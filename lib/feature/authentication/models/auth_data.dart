import 'package:dio/dio.dart';

class AuthData {
  final Dio dio = Dio();
  postData({
    required name,
    required email,
    required phone,
    required nationalId,
    required gender,
    required password,
    required token,
    required profileImage,
  }) async {
    var response =
        await dio.post('https://elwekala.onrender.com/user/register', data: {
      "name": name,
      "email": email,
      "phone": phone,
      "nationalId": nationalId,
      "gender": gender,
      "password": password,
      "token": token,
      "profileImage": profileImage
    });
    var data = response.data;
    print(data);
    print("=============================================");
    print(response.statusCode);
    print("=============================================");
  }
}
