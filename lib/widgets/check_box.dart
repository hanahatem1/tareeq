import 'package:flutter/material.dart';
import 'package:tareeq/const.dart';

class checkBox extends StatefulWidget{
  checkBox({super.key});

  @override
  State<checkBox> createState() => _checkBoxState();
}

class _checkBoxState extends State<checkBox> {

  bool state1=false;
  bool state2=false;
  bool state3=false;
  bool state4=false;
  bool state5=false;
  bool state6=false;
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                activeColor: Colors.white,
                checkColor:Color(0xffE8C872) ,
                shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(2.0),
              ),
              side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(width: 1.0, color: Color(0xffE8C872)),
              ),
                value: state1, onChanged: (val){
                setState(() {
                  state1 = val!;
                });
               }),
                Text('Need Food',style: TextStyle(color:kprimaryColor,fontFamily: kFont,fontSize: 11),),
                SizedBox(width: 20,),
                   Checkbox(
                activeColor: Colors.white,
                checkColor:Color(0xffE8C872) ,
                shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(2.0),
              ),
              side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(width: 1.0, color: Color(0xffE8C872)),
              ),
                value: state2, onChanged: (val){
                setState(() {
                  state2 = val!;
                });
               }),
                   Text('Need Medicine',style: TextStyle(color:kprimaryColor,fontFamily: kFont,fontSize: 11),),
      
            ],
          ),
          //SizedBox(height: 1),
         Row(
            children: [
              Checkbox(
                activeColor: Colors.white,
                checkColor:Color(0xffE8C872) ,
                shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(2.0),
              ),
              side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(width: 1.0, color: Color(0xffE8C872)),
              ),
                value: state3, onChanged: (val){
                setState(() {
                  state3 = val!;
                });
               }),
                Text('Need Petrol',style: TextStyle(color:kprimaryColor,fontFamily: kFont,fontSize: 11),),
                SizedBox(width: 12,),
                   Checkbox(
                activeColor: Colors.white,
                checkColor:Color(0xffE8C872) ,
                shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(2.0),
              ),
              side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(width: 1.0, color: Color(0xffE8C872)),
              ),
                value: state4, onChanged: (val){
                setState(() {
                  state4 = val!;
                });
               }),
              Text('Need Ambluance',style: TextStyle(color:kprimaryColor,fontFamily: kFont,fontSize: 11),),
      
            ],
          ),
        // SizedBox(height: 1),
         Row(
            children: [
              Checkbox(
                activeColor: Colors.white,
                checkColor:Color(0xffE8C872) ,
                shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(2.0),
              ),
              side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(width: 1.0, color: Color(0xffE8C872)),
              ),
                value: state5, onChanged: (val){
                setState(() {
                  state5 = val!;
                });
               }),
                Text('Need Uber',style: TextStyle(color:kprimaryColor,fontFamily: kFont,fontSize: 11),),
                SizedBox(width: 20,),
                   Checkbox(
                activeColor: Colors.white,
                checkColor:Color(0xffE8C872) ,
                shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(2.0),
              ),
              side: MaterialStateBorderSide.resolveWith(
              (states) => BorderSide(width: 1.0, color: Color(0xffE8C872)),
              ),
                value: state6, onChanged: (val){
                setState(() {
                  state6 = val!;
                });
               }),
              Text('Need Doctor',style: TextStyle(color:kprimaryColor,fontFamily: kFont,fontSize: 11),),
      
            ],
          ),
         
        ],
      ),
    );
  }
}