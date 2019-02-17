import 'package:flutter/material.dart';
import 'package:flutter_assignment/ui_page/login.dart';
import 'package:flutter_assignment/ui_page/mainpage.dart';
import 'package:flutter_assignment/ui_page/register.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyCustomFormLogin(),
        '/register': (context) => MyCustomFormRegister(), 
        '/mainpage': (context) => MainPage(),
      },
    );
  }
}
