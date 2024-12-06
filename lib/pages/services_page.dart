import 'package:flutter/material.dart';
import 'package:tareeq/const.dart';
import 'package:tareeq/widgets/bottom_navigation_bar.dart';
import 'package:tareeq/widgets/custom_card_blue.dart';
import 'package:tareeq/widgets/custom_card_yellow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tareeq/widgets/gridView.dart';


class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

static String id='ServicesPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:AppBar(
      automaticallyImplyLeading: false,
        elevation: 4.0,
        backgroundColor: Color(0xffE8C872),
        title: Center(child: Text("choose your service",style: TextStyle(color:kprimaryColor,fontWeight: FontWeight.bold,fontFamily: kFont,fontSize: 17))),
        
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 14,left: 14,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container( 
                  height: 35,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xffFFF3CF),
                     borderRadius: BorderRadius.circular(16)
                  ),
                  child: Center(child: Text("Most services",style: TextStyle(color: kprimaryColor,fontWeight: FontWeight.bold,fontFamily: kFont,fontSize: 14),)),
                ),
              ],
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          CustomCard(image: "assets/images/services/Mechanical_Engineer.png",title: "Mechanical",title2: "Engineer",),
          CustomCard(image: "assets/images/services/Transportation.png", title: "Transportation"),
          CustomCard(image: "assets/images/services/Winch.png", title: "Winch"),
          CustomCard(image: "assets/images/services/Maintenance.png", title: "Maintenance")
        ],),
       const SizedBox(height:20 ,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(12)
              ),
              width: 65,
              height: 6,
            ),
            Container(
              decoration: BoxDecoration(
               color: Color(0xffF1EFEF),
              ),
          width: 55,
          height: 6,  
        )
          ],
        ),
       const SizedBox(height:14),
         Container(width: 100,height: 1.8,color: Color(0xffe3e0db),),
      
            Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     const SizedBox(height: 14),
                      Text("  other Services",style: TextStyle(color: Color(0xff5C7293),fontSize:12,fontFamily: kFont,fontWeight: FontWeight.w700),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                 OtherServicesScreen()
                ]
               ),
            ),
            
        ]),
       bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}