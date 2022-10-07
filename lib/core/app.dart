import 'package:flutter/material.dart';
import 'package:netflix/modules/login/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}