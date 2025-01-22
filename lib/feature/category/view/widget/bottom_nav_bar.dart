import 'package:flutter/material.dart';
import 'package:store/feature/category/view/screen/home_screen.dart';
import 'package:store/feature/profile/view/profile_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      case 0:
         HomeScreen();
        
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:store/feature/category/view/screen/home_screen.dart';
// import 'package:store/feature/profile/view/profile_screen.dart';

// class CustomBottomNavBar extends StatefulWidget {
//   const CustomBottomNavBar({super.key});

//   @override
  
//   // ignore: library_private_types_in_public_api
//   _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
// }

// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {

//   @override
//   Widget build(BuildContext context) {
//     return  BottomNavigationBar(
//         items:  [
//           BottomNavigationBarItem(
//             icon: IconButton(icon: Icon(Icons.home),onPressed: () {
//               Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(
//                           builder: (context) => HomeScreen(),
//                         ),
//                       );
//             }, ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: IconButton(icon: Icon(Icons.person), onPressed: () {
//               Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(
//                           builder: (context) => ProfileScreen(),
//                         ),
//                       );
//             },),
//             label: 'Profile',
//           ),
//         ], 
//     );
//   }
// }
