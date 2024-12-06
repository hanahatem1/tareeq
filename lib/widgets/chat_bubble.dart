
import 'package:flutter/material.dart';
import 'package:tareeq/const.dart';
import 'package:tareeq/models/message.dart';

class ChatBubble extends StatelessWidget{
  ChatBubble({super.key,required this.message});


final Message message;
@override
  Widget build (BuildContext context){
    return Padding(
            padding: const EdgeInsets.only(top: 24,bottom: 50,left: 5),
            child: Row(
              children: [
                  Material(
                     borderRadius: BorderRadius.circular(25),
                     elevation: 4,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/Chat.png'),
                    ),
                  ),  
                
                    Material(
                     borderRadius: BorderRadius.circular(25),
                     elevation: 3,
                     child: Align(
                      alignment: Alignment.centerLeft,
                       child: Container(
                        padding: EdgeInsets.only(left: 16,bottom: 15,top: 16,right: 16),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)
                          ),
                         color: const Color(0xffF9ECC4),
                        ),
                         // width: 191,
                          //height: 52,  
                          
                          child: Text(message.message,style: TextStyle(fontFamily: kFont,fontSize: 10,color: Color(0xff3C4B63)),),
                        ),
                     ),
                   ),
                 
                
              ],
            ),
          );
  }
}

class ChatBubbleToFriend extends StatelessWidget{
  ChatBubbleToFriend({super.key,required this.message});


final Message message;
@override
  Widget build (BuildContext context){
    return Padding(
            padding: const EdgeInsets.only(top: 24,bottom: 50,left: 5),
            child: Row(
              children: [
                  Material(
                     borderRadius: BorderRadius.circular(25),
                     elevation: 4,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/ii.jpg'),
                    ),
                  ),  
                
                    Material(
                     borderRadius: BorderRadius.circular(25),
                     elevation: 3,
                     child: Align(
                      alignment: Alignment.centerLeft,
                       child: Container(
                        padding: EdgeInsets.only(left: 16,bottom: 15,top: 16,right: 16),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)
                          ),
                         color: kprimaryColor,
                        ),
                         // width: 191,
                          //height: 52,  
                          
                          child: Text(message.message,style: TextStyle(fontFamily: kFont,fontSize: 10,color: Color(0xff3C4B63)),),
                        ),
                     ),
                   ),
                 
                
              ],
            ),
          );
  }
}