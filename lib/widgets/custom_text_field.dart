import 'package:flutter/material.dart' as flutterTextField;
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key,this.hintText,this.onChanged,this.obscureText=false});
 

 String? hintText;
  bool obscureText;
 Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return flutterTextField.SizedBox(
      height: 55,
       width: 350,
      child: flutterTextField.TextFormField(
        obscureText: obscureText,
        validator: (data) {
          if(data!.isEmpty){
           return 'field is required';          
           }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xfff7f7f7),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xfff7f7f7)),
           borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.all(Radius.circular(24)),
           borderSide: BorderSide(color: Color(0xfff7f7f7))
          ),
          hintText: hintText,
           hintStyle: TextStyle(color:Colors.grey )
        ),
      ),
    );
  }
}