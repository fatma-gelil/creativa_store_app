import 'package:flutter/material.dart';

AppBar categoryAppBar({required String title}){

    
    return AppBar(
      title:  Text(
        title,
        style: const TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
    );
  
}



