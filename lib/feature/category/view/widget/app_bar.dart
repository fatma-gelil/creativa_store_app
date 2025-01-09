import 'package:flutter/material.dart';

AppBar categoryAppBar({required String title}){

    
    return AppBar(
      title:  Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  
}



