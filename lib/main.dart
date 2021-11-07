import 'package:api_nasa/src/screens/dashboard.dart';
import 'package:api_nasa/src/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:api_nasa/src/screens/mars_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
            '/photo' : (BuildContext context) => MarsScreen(),
            '/detail' : (BuildContext context) => DetailScreen(),

      },
       debugShowCheckedModeBanner: false,
        home: DashBoardScreen(),
    );
     

  }
}