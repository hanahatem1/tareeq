import 'package:flutter/material.dart';
import 'package:tareeq/const.dart'; // Make sure kFont is correctly imported.

class CustomCardY extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  CustomCardY({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Container
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const RadialGradient(
                colors: [Color(0xffEDE1BD), Color(0xffE8C872)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(image),
            ),
          ),
          const SizedBox(width: 8), // Space between the image and the text

          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: const Color(0xff3C4B63),
                    fontWeight: FontWeight.w700,
                    fontFamily: kFont,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: const Color(0xff5C7293),
                    fontSize: 8,
                    fontWeight: FontWeight.w300,
                    fontFamily: kFont,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
