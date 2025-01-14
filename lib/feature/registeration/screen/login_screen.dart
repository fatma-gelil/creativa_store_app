import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widget/validator.dart';
import 'package:store/feature/category/view/screen/home_screen.dart';
import 'package:store/feature/registeration/cubit/cubit/register_cubit.dart';
import 'package:store/feature/registeration/cubit/cubit/register_state.dart';
import 'package:store/feature/registeration/widget/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: BlocConsumer<RegisterCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              if (state.userData["status"] == "success") {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.indigoAccent,
                    content: Text(state.userData["message"])));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }
              if (state.userData["status"] == "error") {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(state.userData["message"])));
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              }
            }

            if (state is LoginFail) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            return Form(
              key: loginFormKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  CustomTextField(
                    controller: nameController,
                    label: const Text("Name"),
                    hintText: 'Enter your name',
                    prefixIcon: const Icon(Icons.person),
                    validator: (value) {
                      return MyValidators.displayNameValidator(value);
                    },
                    suffixIcon: const Icon(Icons.clear),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    label: const Text("Password"),
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.password),
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
                    suffixIcon: const Icon(Icons.clear),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (loginFormKey.currentState!.validate()) {
                        context.read<RegisterCubit>().loginCubit(
                              nameData: nameController.text,
                              passwordData: passwordController.text,
                            );
                      }
                    },
                    child: const Text('Login'),
                  ),
                  if (state is LoginLoad) const CircularProgressIndicator(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
