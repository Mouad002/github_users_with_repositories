import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  // the action of the button
  final Function()? onTap;
  final String text;

  // Constructor
  MyButton({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.lightGreen, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
