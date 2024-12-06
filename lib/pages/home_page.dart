
import 'package:flutter/material.dart';
import 'package:tareeq/const.dart';
import 'package:tareeq/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
         body: Container(
           decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors:[Color(0xfffef1cc),Color(0xffebcd7d)],
              begin: Alignment.topCenter,
              end:Alignment.bottomCenter
         ),
           ),  
           child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 90),
                     const Text(
                      "3 alTareeQ",
                      style:TextStyle(
                        fontFamily: kFont,
                        color: kprimaryColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold
                        ) ,),
                      const Text(
                        "for car services",
                        style:TextStyle(
                          fontFamily:kFont,
                          color: kprimaryColor,
                          fontSize: 20
                          )),
                        
                           Image.asset("assets/images/3AltareeQ.png"),
                       
                     
                      SizedBox(height: 80),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: kprimaryColor,
                           borderRadius: BorderRadius.circular(24)
                          ),
                          
                          height: 50,
                          width: 260,
                          child: Center(child: Text("Log in",style: TextStyle(color: Colors.white,fontFamily:kFont,fontSize: 20))),
                          ),
                      )
                    ],
                  )
                ],
              ),
            
           ), 
         ),
            
    );
  }
}