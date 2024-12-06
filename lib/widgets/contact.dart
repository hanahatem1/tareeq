import 'package:flutter/material.dart';
import 'package:tareeq/const.dart';

class EmergencyContact extends StatelessWidget {
   EmergencyContact({super.key,required this.name,required this.phone});

String name;
String phone;
  @override
  Widget build(BuildContext context) {
    return Row(
                  children: [
                    Container(width: 10,height: 10,decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xffE8C872)),),
                     Text(name,style:const TextStyle(color: Color(0xff6C84A9),fontFamily: kFont,fontWeight: FontWeight.bold),),
                    const SizedBox(width: 120,),
                     Text(phone,style:const TextStyle(color: Color(0xff7C7C7C),fontFamily: kFont,fontWeight: FontWeight.w700),),
                    const SizedBox(width:10,),
                    Icon(Icons.delete,color: Color(0xff982121),size: 18,)
                  ],
                );
  }
}