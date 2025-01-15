import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/category/view/screen/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/feature/registeration/cubit/cubit/register_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => RegisterCubit(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: SplashScreen()),
      ),
    );
  }
}
