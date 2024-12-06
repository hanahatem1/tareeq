import 'package:flutter/material.dart';
import 'package:tareeq/const.dart';

class SecondTextField extends StatelessWidget {
   SecondTextField({super.key,required this.hintText,required this.labalText});

final String hintText;
final String labalText;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                height: 50,
                width: 330,
                child: TextField(
                  decoration: InputDecoration(
                    border:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: kprimaryColor)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:const  BorderSide(color: kprimaryColor),
                     borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: hintText,
                    labelText: labalText,
                    labelStyle:const TextStyle(color: Color(0xff3C4B63),fontFamily: kFont,fontSize: 16,fontWeight: FontWeight.w700) ,
                  ),
                ),
              
    );
  }
}