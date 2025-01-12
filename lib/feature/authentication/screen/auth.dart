import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widget/validator.dart';
import 'package:store/feature/authentication/cubit/cubit/auth_cubit.dart';
import 'package:store/feature/authentication/cubit/cubit/auth_state.dart';
import 'package:store/feature/authentication/models/auth_data.dart';
import 'package:store/feature/authentication/widget/custom_text_field,dart';

class Auth extends StatefulWidget {
  Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final AuthData data = AuthData();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController nationalIdController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController tokenController = TextEditingController();

  final TextEditingController profileImageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: BlocConsumer<RegisterCubit, AuthState>(
          listener: (context, state) {
            if(state is AuthSuccess){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.blue,
                  content: Text(state.userData["messange"]))
              );
            }
          },
          builder: (context, state) {
            return BlocBuilder<RegisterCubit, AuthState>(
              builder: (context, state) {
                RegisterCubit auth = RegisterCubit();

                return Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    CustomTextField(
                      controller: nameController,
                      label: const Text("Name"),
                      hintText: 'enter your name',
                      prefixIcon: const Icon(Icons.person),
                      validator: (value) {
                        return MyValidators.displayNameValidator(value);
                      },
                      suffixIcon: const Icon(Icons.clear),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: emailController,
                      label: const Text("Email"),
                      hintText: 'enter your email',
                      prefixIcon: const Icon(Icons.mail),
                      validator: (value) {
                        
                        return MyValidators.emailValidator(value);
                      },
                      suffixIcon: const Icon(Icons.clear),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: phoneController,
                      label: const Text("Phone"),
                      hintText: 'enter your phone',
                      prefixIcon: const Icon(Icons.phone),
                      validator: (value) {
                        return MyValidators.phoneValidator(value);
                      },
                      suffixIcon: const Icon(Icons.clear),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      
                      controller: nationalIdController,
                      label: const Text("National Id"),
                      hintText: 'enter your id',
                      prefixIcon: const Icon(Icons.cast_rounded),
                      validator: (value) {
                        return MyValidators.nationalIdValidator(value);
                      },
                      suffixIcon: const Icon(Icons.clear),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: genderController,
                      label: const Text("Gender"),
                      hintText: 'enter your gender',
                      prefixIcon: const Icon(Icons.person_add_alt_1),
                      validator: (value) {
                        return MyValidators.genderValidator(value: value);
                      },
                      suffixIcon: const Icon(Icons.clear),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      label: const Text("Password"),
                      hintText: 'enter your password',
                      prefixIcon: const Icon(Icons.password),
                      validator: (value) {
                        return MyValidators.passwordValidator(value);
                      },
                      suffixIcon: const Icon(Icons.clear),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: tokenController,
                      label: const Text("Token"),
                      hintText: 'enter your token',
                      prefixIcon: const Icon(Icons.token),
                      validator: (value) {
                        return MyValidators.tokenValidator(value);
                      },
                      suffixIcon: const Icon(Icons.clear),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // CustomTextField(
                    //   controller: profileImageController,
                    //   label: const Text("Profile"),
                    //   hintText: 'enter your photo',
                    //   prefixIcon: const Icon(Icons.photo),
                    //   validator: (value) {
                    //     return MyValidators.imageValidator(value);
                    //   },
                    //   suffixIcon: const Icon(Icons.clear),
                    // ),
                    ElevatedButton(
                        onPressed: () {
                          auth.postDataCubit(
                              nameData: nameController.text,
                              emailData: emailController.text,
                              phoneData: phoneController.text,
                              nationalIdData: nationalIdController.text,
                              genderData: genderController.text,
                              passwordData: passwordController.text,
                              tokenData: tokenController.text,
                              profileImageData: profileImageController.text
                             );
                        },
                        child: const Text('Submit'))
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
