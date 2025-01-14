import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/core/widget/validator.dart';
import 'package:store/feature/category/view/screen/home_screen.dart';
import 'package:store/feature/registeration/cubit/cubit/register_cubit.dart';
import 'package:store/feature/registeration/cubit/cubit/register_state.dart';
import 'package:store/feature/registeration/model/register_model.dart';
import 'package:store/feature/registeration/widget/custom_text_field.dart';
import 'package:store/feature/registeration/widget/gender.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final AuthData data = AuthData();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController nationalIdController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController tokenController = TextEditingController();

  final TextEditingController profileImageController = TextEditingController();
  final registered = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: BlocConsumer<RegisterCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              if (state.userData["status"] == "success") {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.indigoAccent,
                    content: Text(state.userData["message"])));
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              }
              if (state.userData["status"] == "error") {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(state.userData["message"])));
              }
            }
          },
          builder: (context, state) {
            return Form(
              key: registered,
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  context.read<RegisterCubit>().image == null
                      ? MaterialButton(
                          onPressed: () {
                            context.read<RegisterCubit>().addImage();
                          },
                          child: const Icon(
                            Icons.camera,
                            size: 80,
                          ))
                      : Container(
                          height: 80,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: FileImage(
                                  context.read<RegisterCubit>().image!),
                              fit: BoxFit.fill,
                            ),
                          )),
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
                    height: 10,
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
                    height: 10,
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
                    height: 10,
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
                    height: 10,
                  ),
                  GenderSelection(
                    genderController: genderController,
                  ),
                  const SizedBox(
                    height: 10,
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
                    height: 10,
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
                    height: 40,
                  ),
                  ElevatedButton(
                    style:ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),) ,
                      onPressed: () {
                        if (registered.currentState!.validate()) {
                          context.read<RegisterCubit>().postDataCubit(
                                nameData: nameController.text,
                                emailData: emailController.text,
                                phoneData: phoneController.text,
                                nationalIdData: nationalIdController.text,
                                genderData: genderController.text,
                                passwordData: passwordController.text,
                                tokenData: tokenController.text,
                              );
                        }
                      },
                      child: const Text('Submit',style: TextStyle(color: Colors.black),))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
