import 'package:ev_arkadasi/filter/filter_page.dart';
import 'package:ev_arkadasi/home/home_page.dart';
import 'package:ev_arkadasi/login/login_page.dart';
import 'package:ev_arkadasi/register/register_page.dart';
import 'package:ev_arkadasi/splash/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FilterPage(),
    );
  }
}
