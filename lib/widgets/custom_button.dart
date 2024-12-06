import 'package:flutter/material.dart';
import 'package:tareeq/const.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, this.onTap});

  VoidCallback? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: kprimaryColor, borderRadius: BorderRadius.circular(24)),
        height: 60,
        width: 350,
        child: Center(
            child: Text(text,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                    fontSize: 20))),
      ),
    );
  }
}
