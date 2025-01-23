import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store/core/builder/cache_data.dart';
import 'package:store/core/widget/block_observer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:store/feature/fav/data/data.dart';
import 'package:store/feature/profile/model/profile_data.dart';
import 'package:store/my_app.dart';

void main() {
  FavData.getAllFav();
  ProfileData().getData();
  //put this line when using firebase
  WidgetsFlutterBinding.ensureInitialized();
  CacheShared.init();
  Bloc.observer = MyBlocObserver();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}
