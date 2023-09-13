import 'package:flutter/material.dart';
import 'package:two/home.dart';
import 'package:two/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'two',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        '/users': (context) => UsersPage(),
      },
      initialRoute: '/users',
      debugShowCheckedModeBanner: false,
    );
  }
}
