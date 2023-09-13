import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          'home',
        )),
        body: Center(
          child: Text('home', style: Theme.of(context).textTheme.headline4),
        ));
  }
}
