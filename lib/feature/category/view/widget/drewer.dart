import 'package:flutter/material.dart';

import 'package:store/feature/profile/view/profile_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
      },
      child: Drawer(
        backgroundColor: Colors.white,
        child: ProfileScreen(),
      ),
    );
  }
}
