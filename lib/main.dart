import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store/core/widget/block_observer.dart';
import 'package:store/my_app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
