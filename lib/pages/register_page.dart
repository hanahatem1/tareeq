import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tareeq/const.dart';
import 'package:tareeq/pages/login_page.dart';
import 'package:tareeq/widgets/custom_button.dart';
import 'package:tareeq/widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
   RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 String?phone;

  String? password;

  bool isLoading=false;

   GlobalKey<FormState> formKey =GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          body: Form(
          key: formKey,
            child: Container(
               decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors:[Color(0xfffffefd),Color(0xfffff3d0)],
                  begin: Alignment.topCenter,
                  end:Alignment.bottomCenter
             ),
               ),
               child:  Center(
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 24),
                   child: Column(
                    children: [
                        const  SizedBox(height: 90),
                           const   Text(
                              "3 alTareeQ",
                              style:TextStyle(
                                fontFamily: kFont,
                                color: kprimaryColor,
                                fontSize: 35,
                                fontWeight: FontWeight.bold
                                ) ,),
                              const  Text(
                                "for car services",
                                style:TextStyle(
                                  fontFamily:kFont,
                                  color: kprimaryColor,
                                  fontSize: 20
                                  )),
                                  SizedBox(height: 35),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                     const  Text("  User Email",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff675c3d))),
                                CustomTextField(
                                   onChanged: (data){
                                   phone=data;
                                   },
                                  hintText: "Enter Email",
                                  ),
                               const SizedBox(height:50 ),
                                const Text("  Phone Number",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff675c3d))),
                                 CustomTextField(
                                 
                                 
                                  hintText: "Enter Phone Number",
                                  ),
                                  const SizedBox(height:50 ),
                               const  Text("  Password",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff675c3d))),
                                 CustomTextField(
                                  onChanged: (data){
                                    password=data;
                                  },
                                  hintText: "Enter Password",
                                  ),
                                 const SizedBox(height:30),
                                 CustomButton(
                                  onTap: () async{
                                   if (formKey.currentState!.validate()) {
                                    isLoading=true;
                                    setState(() {
                                      
                                    });
        try{
       UserCredential user=await  FirebaseAuth.instance.createUserWithEmailAndPassword(email: phone!, password: password!);
        }on FirebaseAuthException catch (e) {
                                   if (e.code == 'weak-password') {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The password provided is too weak.')));
                                    } else if (e.code == 'email-already-in-use') {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('The account already exists for that phone')));
                                    
                                    }
                                    }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(' Register Successed')));
      
      }else{
      
      }     isLoading=false;
                            setState(() {
                              
                            });
                                  },
                                  text: "Register"
                                  ),
                                const  SizedBox(height: 27),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   const  Text("Have an account already?",style: TextStyle(color: kprimaryColor),),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(" Login now"))
                                  ],
                                 )
                                    ],
                                  )
                    ],
                   ),
                 )
               )
            ),
          )
      ),
    );
  }
}