import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tareeq/const.dart';
import 'package:tareeq/models/message.dart';
import 'package:tareeq/widgets/chat_bubble.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key});

static String id='ChatPage';
final _controller=ScrollController();
CollectionReference messeges =FirebaseFirestore.instance.collection('messeges');
TextEditingController controller= TextEditingController();
  final String openAiApiKey = 'YOUR_OPENAI_API_KEY'; // Replace with actual key


  @override
  Widget build(BuildContext context) {
   var email= ModalRoute.of(context)!.settings.arguments ;
    return StreamBuilder <QuerySnapshot> (
      stream: messeges.orderBy('createdAt',descending: true).snapshots(),
      builder:(context, snapshot) { 
        if(snapshot.hasData){
          List<Message> messagesList =[];
          for(int i=0 ; i<snapshot.data!.docs.length;i++){
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back,color: Colors.white,),),
        title:const Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/Chat.png'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(' Service bot',style: TextStyle(color: Colors.white,fontFamily: kFont,fontSize: 14,fontWeight: FontWeight.w600),),
                const Text('  to help you',style: TextStyle(color: Colors.white,fontFamily: kFont,fontSize: 10),)
              ],
            )
          ],
        ),
      ),
      body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                controller: _controller,
                itemCount: messagesList.length,
                itemBuilder:(context, index) {
                  return ChatBubble(message: messagesList[index],);
                },
              ),
            ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data){
                      messeges.add({
                        'message' : data,
                        'createdAt' : DateTime.now(),
                        'id' : email
                      });
                      controller.clear();
                      _controller.animateTo(
                      0,
                      curve: Curves.easeIn,
                      duration: const Duration(seconds: 1),
                      );
                    },
                    decoration: InputDecoration(
                      fillColor:const Color(0xffF6F7F9),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide:const BorderSide(color:Color(0xffF6F7F9) )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: const BorderSide(color:Color(0xffF6F7F9) )
                      ),
                      hintText: 'ask bot',
                      hintStyle: const TextStyle(color:Color(0xff637A9F),fontFamily: kFont),
                      suffixIcon: const Icon(Icons.send,color:Color(0xff637A9F),)
                    ),
                                 ),
                ),
               
            
          
          ],
        ),
       
    );

        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}