import 'package:shared_preferences/shared_preferences.dart';

 class CacheShared {
 static SharedPreferences? shared;
 static init() async {
    shared = await SharedPreferences.getInstance();
  }
} 




 