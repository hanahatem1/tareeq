import 'package:flutter/material.dart';

class MediaConnect extends StatelessWidget {
    MediaConnect({super.key, required this.image});
 
 String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Image.asset(image),
      ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                     ),
                      height: 45,
                      width: 45,
           );
  }
}