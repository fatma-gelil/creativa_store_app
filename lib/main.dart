import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store/core/widget/block_observer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:store/my_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), 
    ),
  );
}
