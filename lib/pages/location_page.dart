import 'package:flutter/material.dart';
import 'package:tareeq/const.dart';
import 'package:tareeq/pages/services_page.dart';
import 'package:tareeq/widgets/check_box.dart';
import 'package:tareeq/widgets/second_text_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LocationPage extends StatelessWidget {
   LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        },icon: Icon(Icons.arrow_back),color: Colors.white,),
        backgroundColor: kprimaryColor,
        title:const Text('Winch Service',style:TextStyle(color: Colors.white,fontFamily: kFont,fontSize: 20),),  
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            children: [
              const SizedBox(height: 12),
              SecondTextField(
                hintText: 'Enter your name',
                labalText: 'car owner name',
                ),
              const SizedBox(height: 35,),
              SecondTextField(
                hintText: 'Enter your car number',
                labalText: 'car number',
              ),
             const SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('     What you need?',style: TextStyle(color:Color(0xff3C4B63),fontFamily: kFont,fontWeight: FontWeight.bold),),
                ],
              ),
              checkBox(),
              const SizedBox(height:1),
              SecondTextField(hintText: 'Write Other needs', labalText: 'Other needs:'),
              const SizedBox(height: 20),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Text('      Location',style: TextStyle(color:Color(0xff3C4B63),fontFamily: kFont,fontWeight: FontWeight.bold,fontSize: 18),),
                     ],
                   ),
                     SizedBox(height: 10),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('          from',style: TextStyle(color:kprimaryColor,fontFamily: kFont,fontWeight: FontWeight.bold),),
                      ],
                     ),
                     const SizedBox(height: 4,),
                    GestureDetector(
                      onTap: (){
                        canLaunchUrl(Uri.parse('https://www.google.com/maps/'));
                      },
                      child: Image(image: AssetImage('assets/images/map.jpg'),)),
                    const SizedBox(height:8),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('          to',style: TextStyle(color:kprimaryColor,fontFamily: kFont,fontWeight: FontWeight.bold),),
                      ],
                     ),
                     const SizedBox(height: 4,),
                    Image(image: AssetImage('assets/images/map.jpg'),),
            ],
          ),
        ),
      ),
    );
  } 
    }