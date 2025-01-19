import 'package:dio/dio.dart';
import 'package:store/core/builder/cache_data.dart';
import 'package:store/feature/profile/model/profile_model.dart';
var getToken=CacheShared.shared!.getDouble("token");
class ProfileData {
  Dio dio = Dio();
  getData() async {
    var response = await dio.post('https://elwekala.onrender.com/user/profile',
        data: {"token":getToken});
    try {
      var repoData = response.data;
      var user = UserProfile.fromjson(repoData);
     
      return user;
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }
}
