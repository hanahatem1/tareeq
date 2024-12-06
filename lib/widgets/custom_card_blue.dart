import 'package:flutter/material.dart';
import 'package:tareeq/const.dart';

class CustomCard extends StatelessWidget {
   CustomCard({super.key,required this.image,required this.title,this.title2});

 String image;
 String title;
 String? title2;
  @override
  Widget build(BuildContext context) {
    return Column(
             children: [
                Container(
                   height: 74,
                   width: 74,
                     decoration: BoxDecoration( 
                      borderRadius: BorderRadius.circular(16),
                      gradient: RadialGradient(
                        colors: [Color(0xff7A95C1),Color(0xff5C7293),]
                        ),
                         boxShadow: [ BoxShadow(
                       color: Colors.grey.withOpacity(0.5),
                       spreadRadius: 0,
                       blurRadius: 7,
                       offset: Offset(0, 3)
                  )]
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(16),
                       child: Image.asset(image),
                     ),
                  ),
                  SizedBox(height: 5,),
                Text(title,style: TextStyle(color:Color(0xff3C4B63),fontWeight: FontWeight.bold,fontFamily: kFont,fontSize: 12)),
                Text(title2?? '',style: TextStyle(color:Color(0xff3C4B63),fontWeight: FontWeight.w900,fontFamily: kFont,fontSize: 12))
             ],
           );
 
  }
}