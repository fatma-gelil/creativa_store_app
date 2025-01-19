import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/feature/profile/cubit/cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileData(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Profile',
            style: const TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ProfileSuccess) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                          state.profileData.profileModel.profileImage),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Icon(
                          Icons.person,
                          size: 30,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          state.profileData.profileModel.name,
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Icon(
                          Icons.email,
                          size: 30,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          state.profileData.profileModel.email,
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Icon(
                          Icons.call,
                          size: 30,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          state.profileData.profileModel.phone,
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Icon(
                          Icons.card_travel,
                          size: 30,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          state.profileData.profileModel.nationalId,
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }


}
