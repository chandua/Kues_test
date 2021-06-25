import 'package:flutter/material.dart';
import 'package:kues_test/view/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(

        fontFamily: 'SourceSansPro',
        primaryColor: Colors.white,
        primaryColorDark: Colors.white,
        backgroundColor: Colors.white,

      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


